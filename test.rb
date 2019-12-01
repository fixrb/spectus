# frozen_string_literal: false

require 'simplecov'

SimpleCov.command_name 'Brutal Tests'
SimpleCov.start

require_relative File.join('lib', 'spectus')

include Spectus

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MAY raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :success

raise unless result.actual.is_a?(NoMethodError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Success: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MAY raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MAY raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"boo\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected \"boo\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"boo\" to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MAY raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"FOO\" to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MAY raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected 42 to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected 42 to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected 42 to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MAY raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MAY raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected Exception to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected Exception to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected Exception to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MAY! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :success

raise unless result.actual.is_a?(NoMethodError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Success: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MAY! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MAY! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"boo\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected \"boo\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"boo\" to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MAY! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"FOO\" to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MAY! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected 42 to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected 42 to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected 42 to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MAY! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MAY! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected Exception to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected Exception to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected Exception to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MUST raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual.is_a?(NoMethodError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Success: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MUST raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MUST raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"boo\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected \"boo\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"boo\" to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MUST raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"FOO\" to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MUST raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected 42 to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected 42 to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected 42 to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MUST raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MUST raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected Exception to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected Exception to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected Exception to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MUST! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual.is_a?(NoMethodError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Success: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MUST! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MUST! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"boo\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected \"boo\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"boo\" to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MUST! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"FOO\" to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MUST! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected 42 to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected 42 to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected 42 to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MUST! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MUST! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected Exception to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Failure: expected Exception to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected Exception to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MUST_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(NoMethodError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Failure: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MUST_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MUST_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"boo\" not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MUST_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"FOO\" not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MUST_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected 42 not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MUST_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MUST_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected Exception not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected Exception not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected Exception not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MUST_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(NoMethodError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Failure: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MUST_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MUST_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"boo\" not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MUST_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"FOO\" not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MUST_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected 42 not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MUST_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MUST_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected Exception not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected Exception not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected Exception not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.SHOULD raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual.is_a?(NoMethodError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Success: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.SHOULD raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.SHOULD raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected \"boo\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Warning: expected \"boo\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected \"boo\" to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.SHOULD raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected \"FOO\" to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.SHOULD raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected 42 to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Warning: expected 42 to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected 42 to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.SHOULD raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Warning: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.SHOULD raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected Exception to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Warning: expected Exception to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected Exception to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.SHOULD! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual.is_a?(NoMethodError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Success: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.SHOULD! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.SHOULD! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected \"boo\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Warning: expected \"boo\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected \"boo\" to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.SHOULD! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected \"FOO\" to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.SHOULD! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected 42 to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Warning: expected 42 to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected 42 to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.SHOULD! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Warning: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.SHOULD! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected Exception to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Warning: expected Exception to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected Exception to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.SHOULD_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual.is_a?(NoMethodError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Warning: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.SHOULD_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.SHOULD_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"boo\" not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.SHOULD_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"FOO\" not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.SHOULD_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected 42 not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.SHOULD_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.SHOULD_NOT raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected Exception not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected Exception not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected Exception not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.SHOULD_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual.is_a?(NoMethodError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Warning: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.SHOULD_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.SHOULD_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"boo\" not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.SHOULD_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"FOO\" not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.SHOULD_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected 42 not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.SHOULD_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.SHOULD_NOT! raise_exception(NoMethodError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected Exception not to raise_exception NoMethodError."
raise unless result.to_s(is_color: false) == "Success: expected Exception not to raise_exception NoMethodError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected Exception not to raise_exception NoMethodError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"


# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MAY raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :info

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == true
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "I"
raise unless result.to_char(is_color: false)  == "I"
raise unless result.to_char(is_color: true)   == "\e[36mI\e[0m"

raise unless result.message               == "Info: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Info: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[36mInfo: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MAY raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MAY raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"boo\" to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MAY raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"FOO\" to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MAY raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected 42 to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected 42 to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected 42 to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MAY raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MAY raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected Exception to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected Exception to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected Exception to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MAY! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :info

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == true
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "I"
raise unless result.to_char(is_color: false)  == "I"
raise unless result.to_char(is_color: true)   == "\e[36mI\e[0m"

raise unless result.message               == "Info: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Info: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[36mInfo: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MAY! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MAY! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"boo\" to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MAY! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"FOO\" to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MAY! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected 42 to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected 42 to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected 42 to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MAY! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MAY! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected Exception to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected Exception to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected Exception to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MUST raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MUST raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MUST raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"boo\" to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MUST raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"FOO\" to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MUST raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected 42 to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected 42 to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected 42 to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MUST raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MUST raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected Exception to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected Exception to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected Exception to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MUST! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MUST! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MUST! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"boo\" to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MUST! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"FOO\" to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MUST! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected 42 to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected 42 to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected 42 to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MUST! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MUST! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected Exception to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Failure: expected Exception to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected Exception to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MUST_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MUST_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MUST_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"boo\" not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MUST_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"FOO\" not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MUST_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected 42 not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MUST_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MUST_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected Exception not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected Exception not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected Exception not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MUST_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MUST_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MUST_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"boo\" not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MUST_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"FOO\" not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MUST_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected 42 not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MUST_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MUST_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected Exception not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected Exception not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected Exception not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.SHOULD raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.SHOULD raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.SHOULD raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected \"boo\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Warning: expected \"boo\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected \"boo\" to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.SHOULD raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected \"FOO\" to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.SHOULD raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected 42 to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Warning: expected 42 to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected 42 to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.SHOULD raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Warning: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.SHOULD raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected Exception to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Warning: expected Exception to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected Exception to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.SHOULD! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.SHOULD! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.SHOULD! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected \"boo\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Warning: expected \"boo\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected \"boo\" to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.SHOULD! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected \"FOO\" to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.SHOULD! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected 42 to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Warning: expected 42 to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected 42 to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.SHOULD! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Warning: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.SHOULD! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected Exception to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Warning: expected Exception to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected Exception to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.SHOULD_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.SHOULD_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Warning: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.SHOULD_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"boo\" not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.SHOULD_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"FOO\" not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.SHOULD_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected 42 not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.SHOULD_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.SHOULD_NOT raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected Exception not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected Exception not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected Exception not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.SHOULD_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.SHOULD_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Warning: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.SHOULD_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"boo\" not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.SHOULD_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"FOO\" not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.SHOULD_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected 42 not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.SHOULD_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.SHOULD_NOT! raise_exception(ArgumentError)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected Exception not to raise_exception ArgumentError."
raise unless result.to_s(is_color: false) == "Success: expected Exception not to raise_exception ArgumentError."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected Exception not to raise_exception ArgumentError.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MAY equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :info

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == true
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "I"
raise unless result.to_char(is_color: false)  == "I"
raise unless result.to_char(is_color: true)   == "\e[36mI\e[0m"

raise unless result.message               == "Info: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Info: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[36mInfo: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MAY equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MAY equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"boo\" to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected \"boo\" to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"boo\" to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MAY equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"FOO\" to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected \"FOO\" to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"FOO\" to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MAY equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected 42 to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, requirement_level: :MAY, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MAY equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MAY equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected Exception to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected Exception to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected Exception to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MAY! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :info

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == true
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "I"
raise unless result.to_char(is_color: false)  == "I"
raise unless result.to_char(is_color: true)   == "\e[36mI\e[0m"

raise unless result.message               == "Info: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Info: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[36mInfo: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MAY! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MAY! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"boo\" to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected \"boo\" to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"boo\" to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MAY! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"FOO\" to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected \"FOO\" to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"FOO\" to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MAY! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected 42 to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, requirement_level: :MAY, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MAY! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MAY! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MAY
raise unless result.to_sym == :failure

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected Exception to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected Exception to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected Exception to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MUST equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MUST equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MUST equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"boo\" to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected \"boo\" to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"boo\" to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MUST equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"FOO\" to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected \"FOO\" to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"FOO\" to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MUST equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected 42 to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MUST equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MUST equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected Exception to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected Exception to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected Exception to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MUST! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MUST! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MUST! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"boo\" to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected \"boo\" to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"boo\" to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MUST! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected \"FOO\" to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected \"FOO\" to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected \"FOO\" to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MUST! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected 42 to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MUST! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Failure: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MUST! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected Exception to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected Exception to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected Exception to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MUST_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MUST_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MUST_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"boo\" not to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected \"boo\" not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"boo\" not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MUST_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"FOO\" not to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected \"FOO\" not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"FOO\" not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MUST_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected 42 not to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected 42 not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected 42 not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: 42, got: false, matcher: :equal, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MUST_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MUST_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected Exception not to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected Exception not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected Exception not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.MUST_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.MUST_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.MUST_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"boo\" not to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected \"boo\" not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"boo\" not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.MUST_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"FOO\" not to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected \"FOO\" not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"FOO\" not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.MUST_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :failure

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == true
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "F"
raise unless result.to_char(is_color: false)  == "F"
raise unless result.to_char(is_color: true)   == "\e[35mF\e[0m"

raise unless result.message               == "Failure: expected 42 not to equal 42."
raise unless result.to_s(is_color: false) == "Failure: expected 42 not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[35mFailure: expected 42 not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: 42, got: false, matcher: :equal, negate: true, requirement_level: :MUST, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.MUST_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.MUST_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :MUST
raise unless result.to_sym == :success

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected Exception not to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected Exception not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected Exception not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :MUST, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.SHOULD equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.SHOULD equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.SHOULD equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected \"boo\" to equal 42."
raise unless result.to_s(is_color: false) == "Warning: expected \"boo\" to equal 42."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected \"boo\" to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.SHOULD equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected \"FOO\" to equal 42."
raise unless result.to_s(is_color: false) == "Warning: expected \"FOO\" to equal 42."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected \"FOO\" to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.SHOULD equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected 42 to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.SHOULD equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Warning: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.SHOULD equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected Exception to equal 42."
raise unless result.to_s(is_color: false) == "Warning: expected Exception to equal 42."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected Exception to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.SHOULD! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.SHOULD! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.SHOULD! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected \"boo\" to equal 42."
raise unless result.to_s(is_color: false) == "Warning: expected \"boo\" to equal 42."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected \"boo\" to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.SHOULD! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected \"FOO\" to equal 42."
raise unless result.to_s(is_color: false) == "Warning: expected \"FOO\" to equal 42."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected \"FOO\" to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.SHOULD! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected 42 to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected 42 to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected 42 to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.SHOULD! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Warning: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.SHOULD! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == false
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected Exception to equal 42."
raise unless result.to_s(is_color: false) == "Warning: expected Exception to equal 42."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected Exception to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.SHOULD_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.SHOULD_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.SHOULD_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"boo\" not to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected \"boo\" not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"boo\" not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.SHOULD_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"FOO\" not to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected \"FOO\" not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"FOO\" not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.SHOULD_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected 42 not to equal 42."
raise unless result.to_s(is_color: false) == "Warning: expected 42 not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected 42 not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: false, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.SHOULD_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.SHOULD_NOT equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected Exception not to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected Exception not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected Exception not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.boom }.SHOULD_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(NoMethodError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: false) == "Error: undefined method `boom' for \"foo\":String (NoMethodError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: undefined method `boom' for \"foo\":String (NoMethodError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.empty?(4) }.SHOULD_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :error

raise unless result.actual == nil

raise unless result.error.is_a?(ArgumentError)

raise unless result.got == nil

raise unless result.error?    == true
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == false
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == false

raise unless result.to_char                   == "E"
raise unless result.to_char(is_color: false)  == "E"
raise unless result.to_char(is_color: true)   == "\e[31mE\e[0m"

raise unless result.message               == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: false) == "Error: wrong number of arguments (given 1, expected 0) (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[31mError: wrong number of arguments (given 1, expected 0) (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.gsub!('f', 'b') }.SHOULD_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == "boo"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"boo\" not to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected \"boo\" not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"boo\" not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 'foo'.upcase }.SHOULD_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == "FOO"

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected \"FOO\" not to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected \"FOO\" not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected \"FOO\" not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { 42 }.SHOULD_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :warning

raise unless result.actual == 42

raise unless result.error == nil

raise unless result.got == false

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == false
raise unless result.valid?    == false
raise unless result.warning?  == true

raise unless result.to_char                   == "W"
raise unless result.to_char(is_color: false)  == "W"
raise unless result.to_char(is_color: true)   == "\e[33mW\e[0m"

raise unless result.message               == "Warning: expected 42 not to equal 42."
raise unless result.to_s(is_color: false) == "Warning: expected 42 not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[33mWarning: expected 42 not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: false, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: false)"

# ------------------------------------------------------------------------------

result = begin
           it { ArgumentError.new }.SHOULD_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual.is_a?(ArgumentError)

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: false) == "Success: ArgumentError (ArgumentError)."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: ArgumentError (ArgumentError).\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: true)"

# ------------------------------------------------------------------------------

result = begin
           it { Exception }.SHOULD_NOT! equal(42)
         rescue Spectus::Result::Fail => e
           e
         end

raise unless result.requirement_level == :SHOULD
raise unless result.to_sym == :success

raise unless result.actual == Exception

raise unless result.error == nil

raise unless result.got == true

raise unless result.error?    == false
raise unless result.failure?  == false
raise unless result.info?     == false
raise unless result.negate?   == true
raise unless result.pass?     == true
raise unless result.success?  == true
raise unless result.valid?    == true
raise unless result.warning?  == false

raise unless result.to_char                   == "."
raise unless result.to_char(is_color: false)  == "."
raise unless result.to_char(is_color: true)   == "\e[32m.\e[0m"

raise unless result.message               == "Success: expected Exception not to equal 42."
raise unless result.to_s(is_color: false) == "Success: expected Exception not to equal 42."
raise unless result.to_s(is_color: true)  == "\e[32mSuccess: expected Exception not to equal 42.\e[0m"

raise unless result.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: true)"
