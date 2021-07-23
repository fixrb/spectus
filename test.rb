#!/usr/bin/env ruby
# frozen_string_literal: false

require "simplecov"

::SimpleCov.command_name "Brutal test suite"
::SimpleCov.start

require "./lib/spectus"

require "matchi/be"
require "matchi/eq"
require "matchi/raise_exception"

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::RaiseException.new(NoMethodError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::RaiseException.new(ArgumentError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::Eq.new("foo")).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to eq \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to eq \"foo\"."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::Be.new(42)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to be 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to be 42."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::RaiseException.new(NoMethodError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to raise exception NoMethodError."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::RaiseException.new(ArgumentError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to raise exception ArgumentError."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::Eq.new("foo")).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to eq \"foo\".\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to eq \"foo\"."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::Be.new(42)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to be 42.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to be 42."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::RaiseException.new(NoMethodError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::RaiseException.new(ArgumentError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::Eq.new("foo")).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to eq \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to eq \"foo\"."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::Be.new(42)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to be 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to be 42."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::RaiseException.new(NoMethodError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to raise exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::RaiseException.new(ArgumentError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to raise exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::Eq.new("foo")).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to eq \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::Be.new(42)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to be 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"be 42\", error: nil, expected: 42, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to be 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to be 42."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::RaiseException.new(NoMethodError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to raise exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::RaiseException.new(ArgumentError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to raise exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::Eq.new("foo")).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to eq \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::Be.new(42)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to be 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"be 42\", error: nil, expected: 42, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to be 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to be 42."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::RaiseException.new(NoMethodError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::RaiseException.new(ArgumentError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::Eq.new("foo")).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to eq \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to eq \"foo\"."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::Be.new(42)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to be 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to be 42."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::RaiseException.new(NoMethodError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to raise exception NoMethodError."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::RaiseException.new(ArgumentError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to raise exception ArgumentError."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::Eq.new("foo")).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to eq \"foo\".\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to eq \"foo\"."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::Be.new(42)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to be 42.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to be 42."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::RaiseException.new(NoMethodError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::RaiseException.new(ArgumentError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::Eq.new("foo")).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to eq \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to eq \"foo\"."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::Be.new(42)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to be 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"FOO\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to be 42."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::RaiseException.new(NoMethodError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to raise exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::RaiseException.new(ArgumentError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to raise exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::Eq.new("foo")).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to eq \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::Be.new(42)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to be 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"be 42\", error: nil, expected: 42, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to be 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to be 42."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::RaiseException.new(NoMethodError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to raise exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::RaiseException.new(ArgumentError)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to raise exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::Eq.new("foo")).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to eq \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::Be.new(42)).call { "foo".upcase }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"FOO\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to be 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"FOO\", definition: \"be 42\", error: nil, expected: 42, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to be 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to be 42."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::RaiseException.new(NoMethodError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"foo\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::RaiseException.new(ArgumentError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"foo\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::Eq.new("foo")).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::Be.new(42)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to be 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"foo\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to be 42."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::RaiseException.new(NoMethodError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"foo\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"foo\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"foo\" to raise exception NoMethodError."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::RaiseException.new(ArgumentError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"foo\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"foo\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"foo\" to raise exception ArgumentError."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::Eq.new("foo")).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::Be.new(42)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"foo\" to be 42.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"foo\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"foo\" to be 42."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::RaiseException.new(NoMethodError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"foo\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::RaiseException.new(ArgumentError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"foo\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::Eq.new("foo")).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Success: expected to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::Be.new(42)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to be 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"foo\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to be 42."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::RaiseException.new(NoMethodError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"foo\" not to raise exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::RaiseException.new(ArgumentError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"foo\" not to raise exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::Eq.new("foo")).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected not to eq \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected not to eq \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected not to eq \"foo\"."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::Be.new(42)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to be 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"be 42\", error: nil, expected: 42, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"foo\" not to be 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to be 42."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::RaiseException.new(NoMethodError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"foo\" not to raise exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::RaiseException.new(ArgumentError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"foo\" not to raise exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::Eq.new("foo")).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected not to eq \"foo\".\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected not to eq \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected not to eq \"foo\"."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::Be.new(42)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to be 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"be 42\", error: nil, expected: 42, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"foo\" not to be 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to be 42."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::RaiseException.new(NoMethodError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"foo\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::RaiseException.new(ArgumentError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"foo\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::Eq.new("foo")).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::Be.new(42)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to be 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"foo\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to be 42."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::RaiseException.new(NoMethodError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"foo\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"foo\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"foo\" to raise exception NoMethodError."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::RaiseException.new(ArgumentError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"foo\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"foo\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"foo\" to raise exception ArgumentError."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::Eq.new("foo")).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::Be.new(42)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"foo\" to be 42.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"foo\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"foo\" to be 42."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::RaiseException.new(NoMethodError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"foo\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::RaiseException.new(ArgumentError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"foo\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::Eq.new("foo")).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Success: expected to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::Be.new(42)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to be 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"foo\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to be 42."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::RaiseException.new(NoMethodError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"foo\" not to raise exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::RaiseException.new(ArgumentError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"foo\" not to raise exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::Eq.new("foo")).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected not to eq \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"foo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected not to eq \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected not to eq \"foo\"."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::Be.new(42)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to be 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"be 42\", error: nil, expected: 42, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"foo\" not to be 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to be 42."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::RaiseException.new(NoMethodError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"foo\" not to raise exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::RaiseException.new(ArgumentError)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"foo\" not to raise exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::Eq.new("foo")).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected not to eq \"foo\".\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected not to eq \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected not to eq \"foo\"."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::Be.new(42)).call { "foo".itself }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"foo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to be 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"foo\", definition: \"be 42\", error: nil, expected: 42, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"foo\" not to be 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to be 42."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::RaiseException.new(NoMethodError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::RaiseException.new(ArgumentError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::Eq.new("foo")).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to eq \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to eq \"foo\"."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::Be.new(42)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to be 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to be 42."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::RaiseException.new(NoMethodError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to raise exception NoMethodError."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::RaiseException.new(ArgumentError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to raise exception ArgumentError."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::Eq.new("foo")).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to eq \"foo\".\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to eq \"foo\"."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::Be.new(42)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to be 42.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to be 42."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::RaiseException.new(NoMethodError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::RaiseException.new(ArgumentError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::Eq.new("foo")).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to eq \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to eq \"foo\"."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::Be.new(42)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to be 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to be 42."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::RaiseException.new(NoMethodError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to raise exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::RaiseException.new(ArgumentError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to raise exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::Eq.new("foo")).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to eq \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::Be.new(42)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to be 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"be 42\", error: nil, expected: 42, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to be 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to be 42."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::RaiseException.new(NoMethodError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to raise exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::RaiseException.new(ArgumentError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to raise exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::Eq.new("foo")).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to eq \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::Be.new(42)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to be 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"be 42\", error: nil, expected: 42, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to be 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to be 42."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::RaiseException.new(NoMethodError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::RaiseException.new(ArgumentError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::Eq.new("foo")).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to eq \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to eq \"foo\"."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::Be.new(42)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to be 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to be 42."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::RaiseException.new(NoMethodError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to raise exception NoMethodError."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::RaiseException.new(ArgumentError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to raise exception ArgumentError."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::Eq.new("foo")).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to eq \"foo\".\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to eq \"foo\"."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::Be.new(42)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to be 42.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to be 42."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::RaiseException.new(NoMethodError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to raise exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::RaiseException.new(ArgumentError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to raise exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::Eq.new("foo")).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to eq \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to eq \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to eq \"foo\"."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::Be.new(42)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to be 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: \"boo\", definition: \"be 42\", error: nil, expected: 42, got: false, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to be 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to be 42."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::RaiseException.new(NoMethodError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to raise exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::RaiseException.new(ArgumentError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to raise exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::Eq.new("foo")).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to eq \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::Be.new(42)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to be 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"be 42\", error: nil, expected: 42, got: true, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to be 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to be 42."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::RaiseException.new(NoMethodError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to raise exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::RaiseException.new(ArgumentError)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to raise exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::Eq.new("foo")).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to eq \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"eq \\\"foo\\\"\", error: nil, expected: \"foo\", got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to eq \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to eq \"foo\"."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::Be.new(42)).call { "foo".gsub!("f", "b") }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "\"boo\""
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to be 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: \"boo\", definition: \"be 42\", error: nil, expected: 42, got: true, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to be 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to be 42."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::RaiseException.new(NoMethodError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<NoMethodError: undefined method `boom' for \"foo\":String>"
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::RaiseException.new(ArgumentError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception ArgumentError\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: :ArgumentError, got: nil, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::Eq.new("foo")).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::Be.new(42)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::RaiseException.new(NoMethodError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<NoMethodError: undefined method `boom' for \"foo\":String>"
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::RaiseException.new(ArgumentError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception ArgumentError\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: :ArgumentError, got: nil, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::Eq.new("foo")).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::Be.new(42)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::RaiseException.new(NoMethodError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<NoMethodError: undefined method `boom' for \"foo\":String>"
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Success: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::RaiseException.new(ArgumentError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "I"
raise if actual.colored_char != "\e[36mI\e[0m"
raise if actual.colored_string != "\e[36m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💡"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != true
raise if actual.inspect != "Expresenter::Pass(actual: nil, definition: \"raise exception ArgumentError\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: :ArgumentError, got: nil, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :info
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::Eq.new("foo")).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "I"
raise if actual.colored_char != "\e[36mI\e[0m"
raise if actual.colored_string != "\e[36m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💡"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != true
raise if actual.inspect != "Expresenter::Pass(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :info
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::Be.new(42)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "I"
raise if actual.colored_char != "\e[36mI\e[0m"
raise if actual.colored_string != "\e[36m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💡"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != true
raise if actual.inspect != "Expresenter::Pass(actual: nil, definition: \"be 42\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :info
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::RaiseException.new(NoMethodError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<NoMethodError: undefined method `boom' for \"foo\":String>"
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::RaiseException.new(ArgumentError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception ArgumentError\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: :ArgumentError, got: nil, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::Eq.new("foo")).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::Be.new(42)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::RaiseException.new(NoMethodError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<NoMethodError: undefined method `boom' for \"foo\":String>"
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::RaiseException.new(ArgumentError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception ArgumentError\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: :ArgumentError, got: nil, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::Eq.new("foo")).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::Be.new(42)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::RaiseException.new(NoMethodError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<NoMethodError: undefined method `boom' for \"foo\":String>"
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::RaiseException.new(ArgumentError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception ArgumentError\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: :ArgumentError, got: nil, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::Eq.new("foo")).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::Be.new(42)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::RaiseException.new(NoMethodError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<NoMethodError: undefined method `boom' for \"foo\":String>"
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::RaiseException.new(ArgumentError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception ArgumentError\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: :ArgumentError, got: nil, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::Eq.new("foo")).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::Be.new(42)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::RaiseException.new(NoMethodError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<NoMethodError: undefined method `boom' for \"foo\":String>"
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: true, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Success: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::RaiseException.new(ArgumentError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "I"
raise if actual.colored_char != "\e[36mI\e[0m"
raise if actual.colored_string != "\e[36m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💡"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != true
raise if actual.inspect != "Expresenter::Pass(actual: nil, definition: \"raise exception ArgumentError\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: :ArgumentError, got: nil, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :info
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::Eq.new("foo")).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "I"
raise if actual.colored_char != "\e[36mI\e[0m"
raise if actual.colored_string != "\e[36m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💡"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != true
raise if actual.inspect != "Expresenter::Pass(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :info
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::Be.new(42)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "I"
raise if actual.colored_char != "\e[36mI\e[0m"
raise if actual.colored_string != "\e[36m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💡"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != true
raise if actual.inspect != "Expresenter::Pass(actual: nil, definition: \"be 42\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :info
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::RaiseException.new(NoMethodError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<NoMethodError: undefined method `boom' for \"foo\":String>"
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::RaiseException.new(ArgumentError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception ArgumentError\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: :ArgumentError, got: nil, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::Eq.new("foo")).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::Be.new(42)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::RaiseException.new(NoMethodError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<NoMethodError: undefined method `boom' for \"foo\":String>"
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :NoMethodError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, definition: \"raise exception NoMethodError\", error: nil, expected: :NoMethodError, got: false, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::RaiseException.new(ArgumentError)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception ArgumentError\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: :ArgumentError, got: nil, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::Eq.new("foo")).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::Be.new(42)).call { "foo".boom }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::RaiseException.new(NoMethodError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception NoMethodError\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: :NoMethodError, got: nil, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::RaiseException.new(ArgumentError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<ArgumentError: wrong number of arguments (given 1, expected 0)>"
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::Eq.new("foo")).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must(Matchi::Be.new(42)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::RaiseException.new(NoMethodError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception NoMethodError\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: :NoMethodError, got: nil, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::RaiseException.new(ArgumentError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<ArgumentError: wrong number of arguments (given 1, expected 0)>"
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::Eq.new("foo")).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should(Matchi::Be.new(42)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::RaiseException.new(NoMethodError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception NoMethodError\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: :NoMethodError, got: nil, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::RaiseException.new(ArgumentError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<ArgumentError: wrong number of arguments (given 1, expected 0)>"
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::Eq.new("foo")).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may(Matchi::Be.new(42)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::RaiseException.new(NoMethodError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception NoMethodError\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: :NoMethodError, got: nil, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::RaiseException.new(ArgumentError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<ArgumentError: wrong number of arguments (given 1, expected 0)>"
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::Eq.new("foo")).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not(Matchi::Be.new(42)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::RaiseException.new(NoMethodError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception NoMethodError\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: :NoMethodError, got: nil, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::RaiseException.new(ArgumentError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<ArgumentError: wrong number of arguments (given 1, expected 0)>"
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::Eq.new("foo")).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not(Matchi::Be.new(42)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::RaiseException.new(NoMethodError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception NoMethodError\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: :NoMethodError, got: nil, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::RaiseException.new(ArgumentError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<ArgumentError: wrong number of arguments (given 1, expected 0)>"
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::Eq.new("foo")).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must!(Matchi::Be.new(42)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, negate: false, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::RaiseException.new(NoMethodError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception NoMethodError\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: :NoMethodError, got: nil, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::RaiseException.new(ArgumentError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<ArgumentError: wrong number of arguments (given 1, expected 0)>"
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::Eq.new("foo")).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should!(Matchi::Be.new(42)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, negate: false, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::RaiseException.new(NoMethodError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception NoMethodError\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: :NoMethodError, got: nil, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::RaiseException.new(ArgumentError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<ArgumentError: wrong number of arguments (given 1, expected 0)>"
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: true, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :success
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::Eq.new("foo")).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.may!(Matchi::Be.new(42)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, negate: false, level: :MAY)"
raise if actual.level != :MAY
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::RaiseException.new(NoMethodError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception NoMethodError\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: :NoMethodError, got: nil, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::RaiseException.new(ArgumentError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<ArgumentError: wrong number of arguments (given 1, expected 0)>"
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "Failure: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :failure
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::Eq.new("foo")).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.must_not!(Matchi::Be.new(42)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, negate: true, level: :MUST)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::RaiseException.new(NoMethodError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != :NoMethodError
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"raise exception NoMethodError\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: :NoMethodError, got: nil, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::RaiseException.new(ArgumentError)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "#<ArgumentError: wrong number of arguments (given 1, expected 0)>"
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.expected != :ArgumentError
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, definition: \"raise exception ArgumentError\", error: nil, expected: :ArgumentError, got: false, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :warning
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::Eq.new("foo")).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != "foo"
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"eq \\\"foo\\\"\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    Spectus.should_not!(Matchi::Be.new(42)).call { "foo".empty?(4) }
  rescue Expresenter::Fail => e
    e
  end
end

raise if actual.actual.inspect != "nil"
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.expected != 42
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Expresenter::Fail(actual: nil, definition: \"be 42\", error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, negate: true, level: :SHOULD)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.warning? != false
