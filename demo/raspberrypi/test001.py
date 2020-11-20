#!/usr/bin/python
# -*- coding: utf-8 -*-

import RPi.GPIO as GPIO
from time import sleep, strftime

# 设置模式
GPIO.setmode(GPIO.BCM)

# 定义GPIO引脚
GPIO_PINS = [2, 3, 4, 17, 27, 22]

# 输出
GPIO.setup(GPIO_PINS, GPIO.OUT)

# 使能开启
def start():
  GPIO.output([GPIO_PINS[0], GPIO_PINS[5]], GPIO.HIGH)

# 停止
def stop():
  GPIO.output(GPIO_PINS, GPIO.LOW)

def forward():
  # 左-前进
  GPIO.output(GPIO_PINS[4],GPIO.HIGH)
  GPIO.output(GPIO_PINS[3],GPIO.LOW)
  # 右-前进
  GPIO.output(GPIO_PINS[1],GPIO.HIGH)
  GPIO.output(GPIO_PINS[2],GPIO.LOW)
  start()

def back():
  GPIO.output(GPIO_PINS[4],GPIO.LOW)
  GPIO.output(GPIO_PINS[3],GPIO.HIGH)
  GPIO.output(GPIO_PINS[1],GPIO.LOW)
  GPIO.output(GPIO_PINS[2],GPIO.HIGH)
  start()

def left():
  GPIO.output(GPIO_PINS[4],GPIO.LOW)
  GPIO.output(GPIO_PINS[3],GPIO.HIGH)
  GPIO.output(GPIO_PINS[1],GPIO.HIGH)
  GPIO.output(GPIO_PINS[2],GPIO.LOW)
  start()

def right():
  GPIO.output(GPIO_PINS[4],GPIO.HIGH)
  GPIO.output(GPIO_PINS[3],GPIO.LOW)
  GPIO.output(GPIO_PINS[1],GPIO.LOW)
  GPIO.output(GPIO_PINS[2],GPIO.HIGH)
  start()

def main():
  try:
    print(strftime("%Y-%m-%d %H:%M"))
    # 前进
    forward()
    sleep(2)
    stop()
    sleep(1)
    # 左转
    left()
    sleep(0.5)
    stop()
    sleep(1)
    # 右转
    right()
    sleep(0.5)
    stop()
    sleep(1)
    # 后退
    back()
    sleep(2)
    stop()
  except:
    print('except')
  finally:
    stop()
    # GPIO.cleanup()
    print('finally')

main()
