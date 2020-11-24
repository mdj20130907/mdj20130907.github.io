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
        self.turn_sleep = 0.2
    def move(self):
        GPIO.output([self.GPIO_PINS[0], self.GPIO_PINS[5]], GPIO.HIGH)
    def stop(self):
        GPIO.output(self.GPIO_PINS, GPIO.LOW)
        self.previous_command = 'stop'
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

# https://docs.python.org/2/howto/sockets.html
# https://docs.python.org/2/library/socket.html
# socker server
class MySocketServer:
    def __init__(self, command_queue, carExcutor):
        self.command_queue = command_queue
        self.carExcutor = carExcutor
        # 继续在当前连接读取数据
        self.read_flag = True
        # 继续接受新客户端连接
        self.accept_flag = True
        # create an INET, STREAMing socket
        self.sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
        # bind the socket to a public host and a well-known port
        server_address = (socket.gethostname(), 9527, )
        self.sock.bind(server_address)
        # become a server socket
        self.sock.listen(1) # 只接受1个连接
        print('listening on %s:%s' % server_address)

    def start(self):
        while self.accept_flag: # 是否接受新连接
            # accept connections from outside
            print('waiting for a connection')
            (client_socket, client_address, ) = self.sock.accept()
            print('connection from %s:%s' % client_address)

            # !! 一般开启新线程去处理
            # The important thing to understand now is this:
            # this is all a “server” socket does.
            # It doesn’t send any data. It doesn’t receive any data. It just produces “client” sockets.
            # Each clientsocket is created in response to some other “client” socket doing a connect() to the host and port we’re bound to.
            # As soon as we’ve created that clientsocket, we go back to listening for more connections.

            # 每次接受了新的连接，都要设置继续读取数据标志
            # 上一个连接结束的时候这个标志被设置成False了
            # 因为只有1个连接，所以此处read_flag不会在多个连接之前混淆状态
            self.read_flag = True

            while self.read_flag: # 是否从当前连接继续读取数据
                command = client_socket.recv(1024).decode()
                print('receive:"%s"' % (command, ))

                # When a recv returns 0 bytes, it means the other side has closed (or is in the process of closing) the connection
                if '' == command: # 客户端断开连接后接收到的是空
                    self.stop_read(client_address)
                    continue
                elif 'exit' == command: # 客户端可显示的发送exit
                    self.stop_read(client_address)
                    continue
                elif 'shutdown' == command: # 客户端发送shutdown要求服务端关闭
                    self.stop_accept()
                    # 此处虽然停止接收新连接了，但是原有的连接仍未断开
                    # 客户端自己顺手把自己关闭了
                    continue
                else:
                    # 客户端保证
                    # 'stop', 'forward', 'back', 'left', 'right'
                    self.command_queue.put(command)
            client_socket.close()
        self.sock.close()
    def stop_read(self, client_address):
        self.read_flag = False
        print('disconnect from client %s:%s' % client_address)
    def stop_accept(self):
        self.accept_flag = False
        self.carExcutor.stop()
        print('stop socket server')

# 队列保证了在一个时间点只有一个command在执行
command_queue = Queue(maxsize=5)
carExcutor = CarExcutor(command_queue)
mySocketServer = MySocketServer(command_queue, carExcutor)

carExcutor.start()
mySocketServer.start()
