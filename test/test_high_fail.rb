require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

subject = -> { 'foo'.upcase }

begin
  Spectus.this(&subject).MUST(Eql: 'foo')
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
  raise 'failing test' unless raised_result.to_char == 'F'
  raise 'failing test' unless raised_result.to_h == {
    subject:    subject,
    challenge:  :call,
    context:    [],
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
    level:      :High,
    negate:     true,
    valid:      false,
    result:     false
  }

  print '.'
end

puts
