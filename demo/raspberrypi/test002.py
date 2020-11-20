#!/usr/bin/python
# -*- coding: utf-8 -*-

# https://www.raspberrypi.org/documentation/usage/gpio/README.md
# Hardware PWM available on GPIO12, GPIO13, GPIO18, GPIO19

import RPi.GPIO as GPIO
from time import sleep, strftime

# 设置模式
GPIO.setmode(GPIO.BCM)

# 定义GPIO引脚
GPIO_PINS = [13, 3, 4, 17, 27, 19]

# 输出
GPIO.setup(GPIO_PINS, GPIO.OUT)

def forward():
  # 左-前进
  GPIO.output(GPIO_PINS[4],GPIO.HIGH)
  GPIO.output(GPIO_PINS[3],GPIO.LOW)
  # 右-前进
  GPIO.output(GPIO_PINS[1],GPIO.HIGH)
  GPIO.output(GPIO_PINS[2],GPIO.LOW)

def back():
  GPIO.output(GPIO_PINS[4],GPIO.LOW)
  GPIO.output(GPIO_PINS[3],GPIO.HIGH)
  GPIO.output(GPIO_PINS[1],GPIO.LOW)
  GPIO.output(GPIO_PINS[2],GPIO.HIGH)

def left():
  GPIO.output(GPIO_PINS[4],GPIO.LOW)
  GPIO.output(GPIO_PINS[3],GPIO.HIGH)
  GPIO.output(GPIO_PINS[1],GPIO.HIGH)
  GPIO.output(GPIO_PINS[2],GPIO.LOW)

def right():
  GPIO.output(GPIO_PINS[4],GPIO.HIGH)
  GPIO.output(GPIO_PINS[3],GPIO.LOW)
  GPIO.output(GPIO_PINS[1],GPIO.LOW)
  GPIO.output(GPIO_PINS[2],GPIO.HIGH)

def stop():
  GPIO.output(GPIO_PINS[1:5], GPIO.LOW)

# PWM
GPIO.output([GPIO_PINS[0], GPIO_PINS[5]], GPIO.HIGH)
ENA_PWM = GPIO.PWM(GPIO_PINS[0], 50)# frequency=50Hz
ENB_PWM = GPIO.PWM(GPIO_PINS[5], 50)
ENA_PWM.start(0)# dc is the duty cycle (0.0 <= dc <= 100.0)
ENB_PWM.start(0)

# 加速到最大，减速至停；循环
try:
  forward()
  while True:
    for dc in range(0, 101, 5):
      ENA_PWM.ChangeDutyCycle(dc)
      ENB_PWM.ChangeDutyCycle(dc)
      sleep(0.1)
      print(dc)
    for dc in range(100, -1, -5):
      ENA_PWM.ChangeDutyCycle(dc)
      ENB_PWM.ChangeDutyCycle(dc)
      sleep(0.1)
      print(dc)
except KeyboardInterrupt:
    pass
finally:
  stop()
  ENA_PWM.stop()
  ENB_PWM.stop()

