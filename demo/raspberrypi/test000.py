#!/usr/bin/python
# -*- coding: utf-8 -*-

import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)

print("IN:{}, OUT:{}, SPI:{}, I2C:{}, HARD_PWM:{}, SERIAL:{}, UNKNOWN:{}".format(GPIO.IN, GPIO.OUT, GPIO.SPI, GPIO.I2C, GPIO.HARD_PWM, GPIO.SERIAL, GPIO.UNKNOWN))

for i in range(0, 28):
    r = GPIO.gpio_function(i)
    print("{}: {}".format(i, r))
