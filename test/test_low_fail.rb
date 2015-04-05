require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

subject = -> { 'foo'.upcase }
object  = Spectus.this(&subject)

begin
  object.MAY(Eql: 'foo')
rescue Spectus::Result::Fail => raised_result
  raise 'failing test' unless raised_result.to_char == 'F'
  raise 'failing test' unless raised_result.to_h == {
    subject:    subject,
    challenge:  :call,
    context:    [],
    actual:     'FOO',
    expected:   { Eql: 'foo' },
    got:        false,
    error:      nil,
    level:      :Low,
    negate:     false,
    valid:      false,
    result:     false
  }

  print '.'
end

puts

subject = -> { 'foo'.upcase(:bar) }
object  = Spectus.this(&subject)

begin
  object.MAY(Eql: 'foo')
rescue Spectus::Result::Fail => raised_result
  raise 'failing test' unless raised_result.error.class == ArgumentError
  raise 'failing test' unless raised_result.to_char == 'E'
  raise 'failing test' unless raised_result.to_h == {
    subject:    subject,
    challenge:  :call,
    context:    [],
    actual:     nil,
    expected:   { Eql: 'foo' },
    got:        nil,
    error:      raised_result.error,
    level:      :Low,
    negate:     false,
    valid:      false,
    result:     false
  }

  print '.'
end

puts
