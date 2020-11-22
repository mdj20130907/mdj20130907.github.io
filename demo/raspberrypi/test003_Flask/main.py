#!/usr/bin/env python
# -*- coding: utf-8 -*-

# https://docs.python.org/2.7/library/queue.html#Queue.Queue
# https://docs.python.org/2.7/library/threading.html#thread-objects
# http://docs.jinkan.org/docs/flask/index.html

#  taskkill /F /IM python.exe

import RPi.GPIO as GPIO
import sys
if sys.version > '3':
    from queue import Queue
else:
	from Queue import Queue
from threading import Thread
from flask import Flask, request

command_queue = Queue(maxsize=5)
worker_flag = True
app = Flask(__name__)


class Car:
    def __init__(self):
        GPIO.setmode(GPIO.BCM)
        self.GPIO_PINS = [13, 3, 4, 17, 27, 19]
        GPIO.setup(self.GPIO_PINS, GPIO.OUT)
    def start(self):
        GPIO.output([self.GPIO_PINS[0], self.GPIO_PINS[5]], GPIO.HIGH)
    def stop(self):
        GPIO.output(self.GPIO_PINS, GPIO.LOW)
    def forward(self):
        GPIO.output(self.GPIO_PINS[4],GPIO.HIGH)
        GPIO.output(self.GPIO_PINS[3],GPIO.LOW)
        GPIO.output(self.GPIO_PINS[1],GPIO.HIGH)
        GPIO.output(self.GPIO_PINS[2],GPIO.LOW)
        self.start()
    def back(self):
        GPIO.output(self.GPIO_PINS[4],GPIO.LOW)
        GPIO.output(self.GPIO_PINS[3],GPIO.HIGH)
        GPIO.output(self.GPIO_PINS[1],GPIO.LOW)
        GPIO.output(self.GPIO_PINS[2],GPIO.HIGH)
        self.start()
    def left(self):
        GPIO.output(self.GPIO_PINS[4],GPIO.LOW)
        GPIO.output(self.GPIO_PINS[3],GPIO.HIGH)
        GPIO.output(self.GPIO_PINS[1],GPIO.HIGH)
        GPIO.output(self.GPIO_PINS[2],GPIO.LOW)
        self.start()
    def right(self):
        GPIO.output(self.GPIO_PINS[4],GPIO.HIGH)
        GPIO.output(self.GPIO_PINS[3],GPIO.LOW)
        GPIO.output(self.GPIO_PINS[1],GPIO.LOW)
        GPIO.output(self.GPIO_PINS[2],GPIO.HIGH)
        self.start()
    def excute(self, name):
        if name in ('stop', 'forward', 'back', 'left', 'right'):
            getattr(self, name)()

class CarExcutor:
    def __init__(self):
        self.car = Car()
        self.worker_flag = True
        self.worker_thread = Thread(target=self.worker)
    def worker(self):
        while self.worker_flag:
            command = command_queue.get() # blocking
            app.logger.warning('command "%s" is dequeued' % (command,))
            self.car.excute(command)
        app.logger.warning('worker_flag is False, stop loop')
    def stop(self):
        # stop worker loop
        self.worker_flag = False
        # stop queue get blocking
        command_queue.put('stop')
        # wait for worker_thread to terminate
        while self.worker_thread.is_alive():
            app.logger.warning('worker_thread is alive, wait 60s')
            self.worker_thread.join(60)

carExcutor = CarExcutor()

# fuck ctrl+c, debug=False才能用
@app.route('/shutdown')
def shutdown():
    # stop car executor
    carExcutor.stop()    
    # shutdown flask app
    if not 'werkzeug.server.shutdown' in request.environ:
        raise RuntimeError('not running the development server')
    request.environ['werkzeug.server.shutdown']()
    # useless
    return 'worker is shutdown'

@app.route('/execute/<command>')
def execute(command):
    command_queue.put(command)
    msg = 'command "%s" is queued' % (command,)
    app.logger.warning(msg)
    return msg

if __name__ == '__main__':
    carExcutor.worker_thread.start()
    app.run(host='0.0.0.0', debug=False)
