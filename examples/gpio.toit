// Copyright (C) 2021 Toitware ApS. All rights reserved.

/**
This example demonstrates the use of the morse package with an ESP32.
It assumes that pin 23 is connected to an LED (and an appropriate resistor).
*/

import morse-tutorial
import gpio

// Update the pin here if you use a different one.
LED-PIN ::= 23

main:
  pin := gpio.Pin --output LED-PIN

  10.repeat:
    morse-tutorial.emit
        morse-tutorial.encode-string "ababc"
        --dot-duration= Duration --ms=250
        --on=:  pin.set 1
        --off=: pin.set 0
    sleep (Duration --ms=3000)
