require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

subject = -> { 'foo'.upcase }

result = Spectus.this(&subject).SHOULD(Eql: 'foo')

fail unless result.to_char == 'I'
fail unless result.to_char(true) == "\e[33mI\e[0m"
fail unless result.message == 'Info: Expected "FOO" to eql "foo".'
fail unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     'FOO',
  expected:   { Eql: 'foo' },
  got:        false,
  error:      nil,
  level:      :Medium,
  negate:     false,
  valid:      false,
  result:     true
}

print '.'

result = Spectus.this(&subject).SHOULD_NOT(Eql: 'foo')

fail unless result.to_char == '.'
fail unless result.to_char(true) == "\e[32m.\e[0m"
fail unless result.message == 'Pass: Expected "FOO" not to eql "foo".'
fail unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     'FOO',
  expected:   { Eql: 'foo' },
  got:        true,
  error:      nil,
  level:      :Medium,
  negate:     true,
  valid:      true,
  result:     true
}

print '.'

result = Spectus.this(&subject).SHOULD(Eql: 'FOO')

fail unless result.to_char == '.'
fail unless result.to_char(true) == "\e[32m.\e[0m"
fail unless result.message == 'Pass: Expected "FOO" to eql "FOO".'
fail unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     'FOO',
  expected:   { Eql: 'FOO' },
  got:        true,
  error:      nil,
  level:      :Medium,
  negate:     false,
  valid:      true,
  result:     true
}

print '.'

result = Spectus.this(&subject).SHOULD_NOT(Eql: 'FOO')

fail unless result.to_char == 'I'
fail unless result.to_char(true) == "\e[33mI\e[0m"
fail unless result.message == 'Info: Expected "FOO" not to eql "FOO".'
fail unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     'FOO',
  expected:   { Eql: 'FOO' },
  got:        false,
  error:      nil,
  level:      :Medium,
  negate:     true,
  valid:      false,
  result:     true
}

print '.'

puts
