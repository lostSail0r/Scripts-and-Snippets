#!/usr/bin/env python
# -*- coding: utf-8 -*-
from time import sleep
import os
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setup(23, GPIO.IN)
GPIO.setup(24, GPIO.IN)
GPIO.setup(25, GPIO.IN)

while True:
        if ( GPIO.input(23) == False ):
                os.system('mpg321 1.mp3 &')
        if ( GPIO.input(24) == False ):
                os.system('mpg321 2.mp3 &')
        if ( GPIO.input(25)== False ):
                os.system('mpg321 3.mp3 &')
        sleep(0.5);