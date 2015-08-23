require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

subject = -> { 'foo'.upcase }

begin
  Spectus.this(&subject).MAY(Eql: 'foo')
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.to_char == 'F'
  raise unless raised_result.message == 'Failure: Expected "FOO" to eql "foo".'
  raise unless raised_result.to_h == {
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

subject = -> { 'foo'.upcase(:bar) }

begin
  Spectus.this(&subject).MAY(Eql: 'foo')
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.error.class == ArgumentError
  raise unless raised_result.to_char == 'E'
  raise unless raised_result.message ==
               'Error: wrong number of arguments (1 for 0) (ArgumentError).'
  raise unless raised_result.to_h == {
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
