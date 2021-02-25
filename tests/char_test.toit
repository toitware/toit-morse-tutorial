// Copyright (C) 2021 Toitware ApS. All rights reserved.

import ..src.morse
import expect show *

main:
  encoded := encode_string "a"
  expect_list_equals [DOT, DASH, SPACE_LETTER] encoded

