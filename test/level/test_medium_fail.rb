require_relative File.join '..', 'support', 'coverage'
require_relative File.join '..', '..', 'lib', 'spectus'

include Spectus

subject = -> { 'foo'.bar }

begin
  it(&subject).SHOULD eql('foo')
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.error.class == NoMethodError
  raise unless raised_result.failure? == false
  raise unless raised_result.error? == true
  raise unless raised_result.to_sym == :error
  raise unless raised_result.to_char == 'E'
  raise unless raised_result.to_char(true) == "\e[31mE\e[0m"

  if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'ruby' &&
     defined?(RUBY_VERSION) && RUBY_VERSION.start_with?('2.')

    raise unless raised_result.message ==
                 'Error: ' \
                 'undefined method `bar\' for "foo":String (NoMethodError).'
  end

  raise unless raised_result.to_h == {
    subject:    subject,
    challenge:  { method: :call, args: [] },
    actual:     nil,
    expected:   { Eql: ['foo'] },
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
  it(&subject).SHOULD_NOT eql('foo')
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.error.class == NoMethodError
  raise unless raised_result.failure? == false
  raise unless raised_result.error? == true
  raise unless raised_result.to_sym == :error
  raise unless raised_result.to_char == 'E'
  raise unless raised_result.to_char(true) == "\e[31mE\e[0m"

  if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'ruby' &&
     defined?(RUBY_VERSION) && RUBY_VERSION.start_with?('2.')

    raise unless raised_result.message ==
                 'Error: ' \
                 'undefined method `bar\' for "foo":String (NoMethodError).'
  end

  raise unless raised_result.to_h == {
    subject:    subject,
    challenge:  { method: :call, args: [] },
    actual:     nil,
    expected:   { Eql: ['foo'] },
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
