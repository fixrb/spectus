require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

subject = -> { 'foo'.upcase }
object  = Spectus.this(&subject)

result = object.SHOULD(Eql: 'foo')

fail 'failing test' unless result.to_char == 'I'
fail 'failing test' unless result.to_h == {
  subject:    subject,
  challenge:  :call,
  context:    [],
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

result = object.SHOULD_NOT(Eql: 'foo')

fail 'failing test' unless result.to_char == '.'
fail 'failing test' unless result.to_h == {
  subject:    subject,
  challenge:  :call,
  context:    [],
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

result = object.SHOULD(Eql: 'FOO')

fail 'failing test' unless result.to_char == '.'
fail 'failing test' unless result.to_h == {
  subject:    subject,
  challenge:  :call,
  context:    [],
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

result = object.SHOULD_NOT(Eql: 'FOO')

fail 'failing test' unless result.to_char == 'I'
fail 'failing test' unless result.to_h == {
  subject:    subject,
  challenge:  :call,
  context:    [],
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
