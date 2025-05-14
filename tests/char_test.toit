// Copyright (C) 2021 Toitware ApS. All rights reserved.

import morse-tutorial show *
import expect show *

main:
  encoded := encode-string "a"
  expect-list-equals [DOT, DASH, SPACE-LETTER] encoded

