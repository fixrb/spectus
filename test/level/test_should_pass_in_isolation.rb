# frozen_string_literal: true

require_relative File.join('..', 'support', 'coverage')
require_relative File.join('..', '..', 'lib', 'spectus')

include Spectus
front_object = 'foo'


print 'Testing medium requirement expectations that pass ' \
      'when the actual value is computed in isolation'


# @note When challenging the subject against an implemented method.
subject = -> { front_object.upcase }

result = it(&subject).SHOULD! eql('foo')

raise unless result.success? == false
raise unless result.info? == false
raise unless result.warning? == true
raise unless result.to_sym == :warning
raise unless result.to_char(false) == 'W'
raise unless result.to_char(true) == "\e[34mW\e[0m"
raise unless result.to_char == "\e[34mW\e[0m"
raise unless result.message == 'Warning: expected "FOO" to eql "foo".'
raise unless result.to_h == {
  subject:            subject,
  challenge:          { method: :call, args: [], opts: {}, block: nil },
  actual:             'FOO',
  expected:           { Eql: ['foo'] },
  got:                false,
  error:              nil,
  requirement_level:  :SHOULD,
  negate:             false,
  valid:              false,
  result:             true
}

print "\e[32m.\e[0m"

result = it(&subject).SHOULD_NOT! eql('foo')

raise unless result.success? == true
raise unless result.info? == false
raise unless result.to_sym == :success
raise unless result.to_char(false) == '.'
raise unless result.to_char(true) == "\e[32m.\e[0m"
raise unless result.to_char == "\e[32m.\e[0m"
raise unless result.message == 'Success: expected "FOO" not to eql "foo".'
raise unless result.to_h == {
  subject:            subject,
  challenge:          { method: :call, args: [], opts: {}, block: nil },
  actual:             'FOO',
  expected:           { Eql: ['foo'] },
  got:                true,
  error:              nil,
  requirement_level:  :SHOULD,
  negate:             true,
  valid:              true,
  result:             true
}

print "\e[32m.\e[0m"

result = it(&subject).SHOULD! eql('FOO')

raise unless result.success? == true
raise unless result.info? == false
raise unless result.warning? == false
raise unless result.error? == false
raise unless result.to_sym == :success
raise unless result.to_char(false) == '.'
raise unless result.to_char(true) == "\e[32m.\e[0m"
raise unless result.to_char == "\e[32m.\e[0m"
raise unless result.message == 'Success: expected "FOO" to eql "FOO".'
raise unless result.to_h == {
  subject:            subject,
  challenge:          { method: :call, args: [], opts: {}, block: nil },
  actual:             'FOO',
  expected:           { Eql: ['FOO'] },
  got:                true,
  error:              nil,
  requirement_level:  :SHOULD,
  negate:             false,
  valid:              true,
  result:             true
}

print "\e[32m.\e[0m"

result = it(&subject).SHOULD_NOT! eql('FOO')

raise unless result.success? == false
raise unless result.info? == false
raise unless result.warning? == true
raise unless result.to_sym == :warning
raise unless result.to_char(false) == 'W'
raise unless result.to_char(true) == "\e[34mW\e[0m"
raise unless result.to_char == "\e[34mW\e[0m"
raise unless result.message == 'Warning: expected "FOO" not to eql "FOO".'
raise unless result.to_h == {
  subject:            subject,
  challenge:          { method: :call, args: [], opts: {}, block: nil },
  actual:             'FOO',
  expected:           { Eql: ['FOO'] },
  got:                false,
  error:              nil,
  requirement_level:  :SHOULD,
  negate:             true,
  valid:              false,
  result:             true
}

print "\e[32m.\e[0m"


puts "\e[32mSuccess!\e[0m"
