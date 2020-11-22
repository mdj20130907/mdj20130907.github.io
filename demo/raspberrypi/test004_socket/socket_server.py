#!/usr/bin/python
# -*- coding: utf-8 -*-
import RPi.GPIO as GPIO
from time import sleep
import sys
if sys.version > '3':
    from queue import Queue
else:
	from Queue import Queue
from threading import Thread
import socket

# 执行stop/forward/back后会保持状态
# 执行left/right后会恢复之前的状态
# left/right在stop的时候不起作用
class Car:
    def __init__(self):
        # GPIO
        GPIO.setmode(GPIO.BCM)
        self.GPIO_PINS = [13, 3, 4, 17, 27, 19]
        GPIO.setup(self.GPIO_PINS, GPIO.OUT)
        # 保存上次执行的不同状态forward/back, left/right后恢复
        self.previous_command = None
        # 每次转向命令的执行时间
        self.turn_sleep = 0.1
    def move(self):
        GPIO.output([self.GPIO_PINS[0], self.GPIO_PINS[5]], GPIO.HIGH)
    def stop(self):
        GPIO.output(self.GPIO_PINS, GPIO.LOW)
        self.previous_command = None
    def forward(self):
        GPIO.output(self.GPIO_PINS[4],GPIO.HIGH)
        GPIO.output(self.GPIO_PINS[3],GPIO.LOW)
        GPIO.output(self.GPIO_PINS[1],GPIO.HIGH)
        GPIO.output(self.GPIO_PINS[2],GPIO.LOW)
        self.move()
        self.previous_command = 'forward'
    def back(self):
        GPIO.output(self.GPIO_PINS[4],GPIO.LOW)
        GPIO.output(self.GPIO_PINS[3],GPIO.HIGH)
        GPIO.output(self.GPIO_PINS[1],GPIO.LOW)
        GPIO.output(self.GPIO_PINS[2],GPIO.HIGH)
        self.move()
        self.previous_command = 'back'
    def left(self):
        if 'stop' != self.previous_command:
            GPIO.output(self.GPIO_PINS[4],GPIO.LOW)
            GPIO.output(self.GPIO_PINS[3],GPIO.HIGH)
            GPIO.output(self.GPIO_PINS[1],GPIO.HIGH)
            GPIO.output(self.GPIO_PINS[2],GPIO.LOW)
            self.move()
            sleep(self.turn_sleep)
            self.excute(self.previous_command)
    def right(self):
        if 'stop' != self.previous_command:
            GPIO.output(self.GPIO_PINS[4],GPIO.HIGH)
            GPIO.output(self.GPIO_PINS[3],GPIO.LOW)
            GPIO.output(self.GPIO_PINS[1],GPIO.LOW)
            GPIO.output(self.GPIO_PINS[2],GPIO.HIGH)
            self.move()
            sleep(self.turn_sleep)
            self.excute(self.previous_command)
    def excute(self, name):
        if name in ('stop', 'forward', 'back', 'left', 'right'):
            print('execute: ' + name)
            getattr(self, name)()

# 执行动作放在单独的线程中
class CarExcutor:
    def __init__(self, command_queue):
        self.command_queue = command_queue
        self.car = Car()
        self.worker_flag = True
        self.worker_thread = Thread(target=self.worker)
    def worker(self):
        while self.worker_flag:
            command = command_queue.get() # blocking
            print('command "%s" is dequeued' % (command,))
            self.car.excute(command)
        print('worker_flag is False, stop loop')
    def start(self):
        self.worker_thread.start()
    def stop(self):
        # stop worker loop
        self.worker_flag = False
        # stop queue get blocking
        command_queue.put('stop')
        # wait for worker_thread to terminate
        while self.worker_thread.is_alive():
            print('worker_thread is alive, wait 60s')
            self.worker_thread.join(60)

# socker server
class MySocketServer:
    def __init__(self, command_queue, carExcutor, host_ip):
        self.command_queue = command_queue
        self.carExcutor = carExcutor
        # 继续在当前连接读取数据
        self.read_flag = True
        # 继续接受新客户端连接
        self.accept_flag = True
        self.server_address = (host_ip, 9527, )
        # Create a TCP/IP socket
        self.sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
        # bind() is used to associate the socket with the server address
        self.sock.bind(self.server_address)
        # listen() puts the socket into server mode, and accept() waits for an incoming connection
        self.sock.listen(1)
        print('listening on %s:%s' % self.server_address)

    def start(self):
        while self.accept_flag:
            print('waiting for a connection')
            (connection, client_address, ) = self.sock.accept()
            print('connection from %s:%s' % client_address)
            # 循环里结束后有新连接进来要开启，只能支持一个客户端
            self.read_flag = True
            try:
                while self.read_flag:
                    command = connection.recv(1024).decode()
                    print('receive: ' + command)
                    if not command or 'exit' == command:
                        # 客户端已经断开连接/发送空数据，不再继续读取数据
                        self.stop_read()
                        continue
                    elif 'shutdown' == command:
                        self.stop_accept()
                        continue
                    else:
                        # 客户端保证
                        # 'stop', 'forward', 'back', 'left', 'right'
                        self.command_queue.put(command)
            finally:
                connection.close()
        self.sock.close()
    def stop_read(self):
        self.read_flag = False
        print('stop reading from this client')
    def stop_accept(self):
        self.accept_flag = False
        self.carExcutor.stop()
        print('stop socket server')

# 队列保证了在一个时间点只有一个command在执行
command_queue = Queue(maxsize=5)
carExcutor = CarExcutor(command_queue)
mySocketServer = MySocketServer(command_queue, carExcutor, '192.168.4.1')

carExcutor.start()
mySocketServer.start()
