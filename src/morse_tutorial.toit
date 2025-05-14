DOT ::= 0
DASH ::= 1
SPACE-LETTER ::= 2


MORSE-CODE_ ::= {
  'a': [ DOT, DASH ],
  'b': [ DASH, DOT, DOT, DOT ],
  'c': [ DASH, DOT, DASH, DOT ],
}

/// The dash duration is three times that of the dot.
DASH-DURATION-FACTOR_ ::= 3
/// The duration between characters is three times the one of a dot.
SPACE-LETTER-FACTOR_ ::= 1

encode-string str:
  result := []
  str.do:
    result.add-all MORSE-CODE_[it]
    result.add SPACE-LETTER
  return result

emit symbols --dot-duration [--on] [--off]:
  symbols.do:
    if it == DOT or it == DASH:
      on.call
      sleep (it == DOT ? dot-duration : dot-duration * DASH-DURATION-FACTOR_)
      off.call
      sleep dot-duration // The space between symbols.
    else:
      assert: it == SPACE-LETTER
      // We already waited a dot-duration after the last character, so we have to
      // wait a bit shorter.
      sleep dot-duration * (SPACE-LETTER-FACTOR_ - 1)
