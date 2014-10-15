/*
Mean Crafty Pi Monster - Eye animation routine
Author: Fabien Royer
Software License Agreement: New BSD License
Copyright (c) 2010-2013, Nwazet, LLC. All rights reserved.
*/

#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <wiringPi.h>

#define PwmPin 18
#define DelayMs 10
#define Step 10

int main (){
  if (wiringPiSetupGpio() == -1){
    fprintf (stdout, "wiringPiSetupGpio failed with error: %s\n", strerror (errno)) ;
    return 1;
  }
  pinMode (PwmPin, PWM_OUTPUT);
  while(1){
        int dutyCycle = 0;
        for(; dutyCycle <= 1000; dutyCycle+=Step){
                pwmWrite(PwmPin, dutyCycle);
                delay(DelayMs);
        }
        for(; dutyCycle > 0; dutyCycle-=Step){
                pwmWrite(PwmPin, dutyCycle);
                delay(DelayMs);
        }
  }
}
