require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

subject = -> { 'foo'.upcase }

result = Spectus.this(&subject).MUST(Eql: 'FOO')

fail 'failing test' unless result.to_char == '.'
fail 'failing test' unless result.to_h == {
  subject:    subject,
  challenge:  :call,
  context:    [],
  actual:     'FOO',
  expected:   { Eql: 'FOO' },
  got:        true,
  error:      nil,
  level:      :High,
  negate:     false,
  valid:      true,
  result:     true
}

print '.'

result = Spectus.this(&subject).MUST_NOT(Eql: 'foo')

fail 'failing test' unless result.to_char == '.'
fail 'failing test' unless result.to_h == {
  subject:    subject,
  challenge:  :call,
  context:    [],
  actual:     'FOO',
  expected:   { Eql: 'foo' },
  got:        true,
  error:      nil,
  level:      :High,
  negate:     true,
  valid:      true,
  result:     true
}

print '.'

puts
