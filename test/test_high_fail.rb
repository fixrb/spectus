require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

subject = -> { 'foo'.upcase }

begin
  Spectus.this(&subject).MUST(Eql: 'foo')
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.failure? == true
  raise unless raised_result.error? == false
  raise unless raised_result.to_sym == :failure
  raise unless raised_result.to_char == 'F'
  raise unless raised_result.to_char(true) == "\e[35mF\e[0m"
  raise unless raised_result.message ==
               'Failure: Expected "FOO" to eql "foo".'
  raise unless raised_result.to_h == {
    subject:    subject,
    challenge:  { method: :call, args: [] },
    actual:     'FOO',
    expected:   { Eql: 'foo' },
    got:        false,
    error:      nil,
    level:      :High,
    negate:     false,
    valid:      false,
    result:     false
  }

  print '.'
end

begin
  Spectus.this(&subject).MUST_NOT(Eql: 'FOO')
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.failure? == true
  raise unless raised_result.error? == false
  raise unless raised_result.to_sym == :failure
  raise unless raised_result.to_char == 'F'
  raise unless raised_result.to_char(true) == "\e[35mF\e[0m"
  raise unless raised_result.message ==
               'Failure: Expected "FOO" not to eql "FOO".'
  raise unless raised_result.to_h == {
    subject:    subject,
    challenge:  { method: :call, args: [] },
    actual:     'FOO',
    expected:   { Eql: 'FOO' },
    got:        false,
    error:      nil,
    level:      :High,
    negate:     true,
    valid:      false,
    result:     false
  }

  print '.'
end

subject = -> { 'foo'.bar }

begin
  Spectus.this(&subject).MUST(Eql: 'foo')
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
    expected:   { Eql: 'foo' },
    got:        nil,
    error:      raised_result.error,
    level:      :High,
    negate:     false,
    valid:      false,
    result:     false
  }

  print '.'
end

begin
  Spectus.this(&subject).MUST_NOT(Eql: 'foo')
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
    expected:   { Eql: 'foo' },
    got:        nil,
    error:      raised_result.error,
    level:      :High,
    negate:     true,
    valid:      false,
    result:     false
  }

  print '.'
end

subject = -> { 'foo'.upcase(:bar) }

begin
  Spectus.this(&subject).MUST(Eql: 'foo')
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.error.class == ArgumentError
  raise unless raised_result.failure? == false
  raise unless raised_result.error? == true
  raise unless raised_result.to_sym == :error
  raise unless raised_result.to_char == 'E'
  raise unless raised_result.to_char(true) == "\e[31mE\e[0m"

  if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'ruby' &&
     defined?(RUBY_VERSION) && RUBY_VERSION.start_with?('2.')

    raise unless raised_result.message ==
                 'Error: wrong number of arguments (1 for 0) (ArgumentError).'
  end

  raise unless raised_result.to_h == {
    subject:    subject,
    challenge:  { method: :call, args: [] },
    actual:     nil,
    expected:   { Eql: 'foo' },
    got:        nil,
    error:      raised_result.error,
    level:      :High,
    negate:     false,
    valid:      false,
    result:     false
  }

  print '.'
end

begin
  Spectus.this(&subject).MUST_NOT(Eql: 'foo')
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.error.class == ArgumentError
  raise unless raised_result.failure? == false
  raise unless raised_result.error? == true
  raise unless raised_result.to_sym == :error
  raise unless raised_result.to_char == 'E'
  raise unless raised_result.to_char(true) == "\e[31mE\e[0m"

  if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'ruby' &&
     defined?(RUBY_VERSION) && RUBY_VERSION.start_with?('2.')

    raise unless raised_result.message ==
                 'Error: wrong number of arguments (1 for 0) (ArgumentError).'
  end

  raise unless raised_result.to_h == {
    subject:    subject,
    challenge:  { method: :call, args: [] },
    actual:     nil,
    expected:   { Eql: 'foo' },
    got:        nil,
    error:      raised_result.error,
    level:      :High,
    negate:     true,
    valid:      false,
    result:     false
  }

  print '.'
end

puts
