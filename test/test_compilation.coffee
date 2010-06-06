# Ensure that carriage returns don't break compilation on Windows.
CoffeeScript: require('./../lib/coffee-script')
Lexer: require('./../lib/lexer')

js: CoffeeScript.compile("one\r\ntwo", {no_wrap: on})

ok js is "one;\ntwo;"
