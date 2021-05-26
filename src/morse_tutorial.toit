DOT ::= 0
DASH ::= 1
SPACE_LETTER ::= 2


MORSE_CODE_ ::= {
  'a': [ DOT, DASH ],
  'b': [ DASH, DOT, DOT, DOT ],
  'c': [ DASH, DOT, DASH, DOT ],
}

/// The dash duration is three times that of the dot.
DASH_DURATION_FACTOR_ ::= 3
/// The duration between characters is three times the one of a dot.
SPACE_LETTER_FACTOR_ ::= 1

encode_string str:
  result := []
  str.do:
    result.add_all MORSE_CODE_[it]
    result.add SPACE_LETTER
  return result

emit symbols --dot_duration [--on] [--off]:
  symbols.do:
    if it == DOT or it == DASH:
      on.call
      sleep (it == DOT ? dot_duration : dot_duration * DASH_DURATION_FACTOR_)
      off.call
      sleep dot_duration // The space between symbols.
    else:
      assert: it == SPACE_LETTER
      // We already waited a dot-duration after the last character, so we have to
      // wait a bit shorter.
      sleep dot_duration * (SPACE_LETTER_FACTOR_ - 1)
