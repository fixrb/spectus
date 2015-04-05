require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

subject = -> { 'foo'.upcase }
object  = Spectus.this(&subject)

result = object.MAY(Eql: 'FOO')

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

puts

subject = -> { 'foo'.bar }
object  = Spectus.this(&subject)

result = object.MAY(Eql: 'foo')

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
