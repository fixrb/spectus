# frozen_string_literal: true

require_relative File.join('..', 'support', 'coverage')
require_relative File.join('..', '..', 'lib', 'spectus')

include Spectus
front_object = true


print 'Testing high requirement expectations that pass'


# @note When challenging the subject against an implemented method.
subject = -> { front_object.itself }

result = it(&subject).MUST be_true

raise unless result.success? == true
raise unless result.info? == false
raise unless result.to_sym == :success
raise unless result.to_char == '.'
raise unless result.to_char(true) == "\e[32m.\e[0m"
raise unless result.message == 'Success: expected true to be_true.'
raise unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [], opts: {}, block: nil },
  actual:     true,
  expected:   { BeTrue: [] },
  got:        true,
  error:      nil,
  level:      :Must,
  negate:     false,
  valid:      true,
  result:     true
}

print "\e[32m.\e[0m"

result = it(&subject).MUST_NOT be_false

raise unless result.success? == true
raise unless result.info? == false
raise unless result.to_sym == :success
raise unless result.to_char == '.'
raise unless result.to_char(true) == "\e[32m.\e[0m"
raise unless result.message == 'Success: expected true not to be_false.'
raise unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [], opts: {}, block: nil },
  actual:     true,
  expected:   { BeFalse: [] },
  got:        true,
  error:      nil,
  level:      :Must,
  negate:     true,
  valid:      true,
  result:     true
}

print "\e[32m.\e[0m"


puts "\e[32mSuccess!\e[0m"
