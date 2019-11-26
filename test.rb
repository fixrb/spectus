# frozen_string_literal: false

require 'simplecov'

SimpleCov.command_name 'Brutal Tests'
SimpleCov.start

require_relative File.join('lib', 'spectus')

include Spectus

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"


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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, requirement_level: :MAY, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: false, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, requirement_level: :MAY, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :MUST, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :MUST, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"FOO\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Pass(actual: \"boo\", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: 42, got: true, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: true)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: false)"

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

raise unless result.inspect == "Spectus::Result::Fail(actual: nil, challenge: Defi(method: :call, args: [], opts: {}, block: ), error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, requirement_level: :SHOULD, valid: false)"
