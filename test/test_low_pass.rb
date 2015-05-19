require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

subject = -> { 'foo'.upcase }

result = Spectus.this(&subject).MAY(Eql: 'FOO')

fail 'failing test' unless result.to_char == '.'
fail 'failing test' unless result.to_h == {
  subject:    subject,
  challenge:  :call,
  context:    [],
  actual:     'FOO',
  expected:   { Eql: 'FOO' },
  got:        true,
  error:      nil,
  level:      :Low,
  negate:     false,
  valid:      true,
  result:     true
}

print '.'

subject = -> { 'foo'.bar }

result = Spectus.this(&subject).MAY(Eql: 'foo')

fail 'failing test' unless result.error.class == NoMethodError
fail 'failing test' unless result.to_char == 'I'
fail 'failing test' unless result.to_h == {
  subject:    subject,
  challenge:  :call,
  context:    [],
  actual:     nil,
  expected:   { Eql: 'foo' },
  got:        nil,
  error:      result.error,
  level:      :Low,
  negate:     false,
  valid:      false,
  result:     true
}

print '.'

puts
