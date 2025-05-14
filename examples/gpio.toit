// Copyright (C) 2021 Toitware ApS. All rights reserved.

/**
This example demonstrates the use of the morse package with an ESP32.
It assumes that pin 23 is connected to an LED (and an appropriate resistor).
*/

import morse_tutorial
import gpio

// Update the pin here if you use a different one.
LED_PIN ::= 23

main:
  pin := gpio.Pin --output LED_PIN

  10.repeat:
    morse_tutorial.emit
        morse_tutorial.encode_string "ababc"
        --dot_duration=(Duration --ms=250)
        --on=: pin.set 1
        --off=: pin.set 0
    sleep (Duration --ms=3000)
