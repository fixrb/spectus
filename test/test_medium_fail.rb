require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

subject = -> { 'foo'.bar }
object  = Spectus.this(&subject)

begin
  object.SHOULD(Eql: 'foo')
rescue Spectus::Result::Fail => raised_result
  raise 'failing test' unless raised_result.error.class == NoMethodError
  raise 'failing test' unless raised_result.to_char == 'E'
  raise 'failing test' unless raised_result.to_h == {
    subject:    subject,
    challenge:  :call,
    context:    [],
    actual:     nil,
    expected:   { Eql: 'foo' },
    got:        nil,
    error:      raised_result.error,
    level:      :Medium,
    negate:     false,
    valid:      false,
    result:     false
  }

  print '.'
end

begin
  object.SHOULD_NOT(Eql: 'foo')
rescue Spectus::Result::Fail => raised_result
  raise 'failing test' unless raised_result.error.class == NoMethodError
  raise 'failing test' unless raised_result.to_char == 'E'
  raise 'failing test' unless raised_result.to_h == {
    subject:    subject,
    challenge:  :call,
    context:    [],
    actual:     nil,
    expected:   { Eql: 'foo' },
    got:        nil,
    error:      raised_result.error,
    level:      :Medium,
    negate:     true,
    valid:      false,
    result:     false
  }

  print '.'
end

puts
