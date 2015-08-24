require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

subject = -> { 'foo'.bar }

begin
  Spectus.this(&subject).SHOULD(Eql: 'foo')
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.error.class == NoMethodError
  raise unless raised_result.to_char == 'E'

  if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'ruby' &&
    defined?(RUBY_VERSION) && RUBY_VERSION == '2.2.3'

    raise unless raised_result.message ==
                 'Error: ' \
                 'undefined method `bar\' for "foo":String (NoMethodError).'
  end

  raise unless raised_result.to_h == {
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
  Spectus.this(&subject).SHOULD_NOT(Eql: 'foo')
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.error.class == NoMethodError
  raise unless raised_result.to_char == 'E'

  if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'ruby' &&
    defined?(RUBY_VERSION) && RUBY_VERSION == '2.2.3'

    raise unless raised_result.message ==
                 'Error: ' \
                 'undefined method `bar\' for "foo":String (NoMethodError).'
  end

  raise unless raised_result.to_h == {
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
