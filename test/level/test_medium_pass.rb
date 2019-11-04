# frozen_string_literal: true

require_relative File.join('..', 'support', 'coverage')
require_relative File.join('..', '..', 'lib', 'spectus')

include Spectus
front_object = 'foo'


print 'Testing medium requirement expectations that pass'


# @note When challenging the subject against an implemented method.
subject = -> { front_object.upcase }

result = it(&subject).SHOULD eql('foo')

raise unless result.success? == false
raise unless result.info? == true
raise unless result.to_sym == :info
raise unless result.to_char == 'I'
raise unless result.to_char(true) == "\e[33mI\e[0m"
raise unless result.message == 'Info: Expected "FOO" to eql "foo".'
raise unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     'FOO',
  expected:   { Eql: ['foo'] },
  got:        false,
  error:      nil,
  level:      :Medium,
  negate:     false,
  valid:      false,
  result:     true
}

print "\e[32m.\e[0m"

result = it(&subject).SHOULD_NOT eql('foo')

raise unless result.success? == true
raise unless result.info? == false
raise unless result.to_sym == :success
raise unless result.to_char == '.'
raise unless result.to_char(true) == "\e[32m.\e[0m"
raise unless result.message == 'Pass: Expected "FOO" not to eql "foo".'
raise unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     'FOO',
  expected:   { Eql: ['foo'] },
  got:        true,
  error:      nil,
  level:      :Medium,
  negate:     true,
  valid:      true,
  result:     true
}

print "\e[32m.\e[0m"


result = it(&subject).SHOULD eql('FOO')

raise unless result.success? == true
raise unless result.info? == false
raise unless result.to_sym == :success
raise unless result.to_char == '.'
raise unless result.to_char(true) == "\e[32m.\e[0m"
raise unless result.message == 'Pass: Expected "FOO" to eql "FOO".'
raise unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     'FOO',
  expected:   { Eql: ['FOO'] },
  got:        true,
  error:      nil,
  level:      :Medium,
  negate:     false,
  valid:      true,
  result:     true
}

print "\e[32m.\e[0m"

result = it(&subject).SHOULD_NOT eql('FOO')

raise unless result.success? == false
raise unless result.info? == true
raise unless result.to_sym == :info
raise unless result.to_char == 'I'
raise unless result.to_char(true) == "\e[33mI\e[0m"
raise unless result.message == 'Info: Expected "FOO" not to eql "FOO".'
raise unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     'FOO',
  expected:   { Eql: ['FOO'] },
  got:        false,
  error:      nil,
  level:      :Medium,
  negate:     true,
  valid:      false,
  result:     true
}

print "\e[32m.\e[0m"


puts "\e[32mSuccess!\e[0m"
