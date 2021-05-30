#!/usr/bin/env ruby
# frozen_string_literal: false

require "simplecov"

::SimpleCov.command_name "Brutal test suite"
::SimpleCov.start

require "./lib/spectus"

self.class.include ::Spectus

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to eql \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to eql \"foo\"."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to equal 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to equal 42."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to eql \"foo\".\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to eql \"foo\"."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to equal 42.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to equal 42."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MAY raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MAY raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MAY eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to eql \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to eql \"foo\"."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MAY equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to equal 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to equal 42."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST_NOT raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST_NOT raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST_NOT eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to eql \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST_NOT equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to equal 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to equal 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to equal 42."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD_NOT raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD_NOT raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD_NOT eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to eql \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD_NOT equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to equal 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to equal 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to equal 42."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to eql \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to eql \"foo\"."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to equal 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"FOO\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to equal 42."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to eql \"foo\".\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to eql \"foo\"."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"FOO\" to equal 42.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"FOO\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"FOO\" to equal 42."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MAY! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MAY! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MAY! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to eql \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to eql \"foo\"."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MAY! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"FOO\" to equal 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"FOO\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"FOO\" to equal 42."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST_NOT! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST_NOT! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST_NOT! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to eql \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.MUST_NOT! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to equal 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"FOO\" not to equal 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to equal 42."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD_NOT! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD_NOT! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD_NOT! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to eql \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".upcase }.SHOULD_NOT! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"FOO\" not to equal 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"FOO\" not to equal 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"FOO\" not to equal 42."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"foo\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise_exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"foo\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise_exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: false, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to equal 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"foo\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to equal 42."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"foo\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"foo\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"foo\" to raise_exception NoMethodError."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"foo\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"foo\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"foo\" to raise_exception ArgumentError."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: false, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"foo\" to equal 42.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"foo\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"foo\" to equal 42."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MAY raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"foo\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise_exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MAY raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"foo\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise_exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MAY eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: false, level: :MAY, valid: true)"
raise if actual.level != :MAY
raise if actual.message != "Success: expected to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MAY equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to equal 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"foo\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to equal 42."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST_NOT raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"foo\" not to raise_exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise_exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST_NOT raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"foo\" not to raise_exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise_exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST_NOT eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected not to eql \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected not to eql \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected not to eql \"foo\"."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST_NOT equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to equal 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"foo\" not to equal 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to equal 42."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD_NOT raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"foo\" not to raise_exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise_exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD_NOT raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"foo\" not to raise_exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise_exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD_NOT eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected not to eql \"foo\".\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected not to eql \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected not to eql \"foo\"."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD_NOT equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to equal 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"foo\" not to equal 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to equal 42."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"foo\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise_exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"foo\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise_exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: false, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to equal 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"foo\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to equal 42."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"foo\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"foo\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"foo\" to raise_exception NoMethodError."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"foo\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"foo\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"foo\" to raise_exception ArgumentError."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: false, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"foo\" to equal 42.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"foo\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"foo\" to equal 42."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MAY! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"foo\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise_exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MAY! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"foo\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to raise_exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MAY! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: false, level: :MAY, valid: true)"
raise if actual.level != :MAY
raise if actual.message != "Success: expected to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MAY! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"foo\" to equal 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"foo\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"foo\" to equal 42."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST_NOT! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"foo\" not to raise_exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise_exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST_NOT! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"foo\" not to raise_exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise_exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST_NOT! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected not to eql \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"foo\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected not to eql \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected not to eql \"foo\"."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.MUST_NOT! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to equal 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"foo\" not to equal 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to equal 42."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD_NOT! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"foo\" not to raise_exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise_exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD_NOT! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"foo\" not to raise_exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to raise_exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD_NOT! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected not to eql \"foo\".\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected not to eql \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected not to eql \"foo\"."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".itself }.SHOULD_NOT! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"foo\" not to equal 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"foo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"foo\" not to equal 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"foo\" not to equal 42."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise_exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise_exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to eql \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to eql \"foo\"."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to equal 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to equal 42."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to raise_exception NoMethodError."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to raise_exception ArgumentError."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to eql \"foo\".\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to eql \"foo\"."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to equal 42.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to equal 42."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MAY raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise_exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MAY raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise_exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MAY eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to eql \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to eql \"foo\"."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MAY equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to equal 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to equal 42."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST_NOT raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to raise_exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise_exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST_NOT raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to raise_exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise_exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST_NOT eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to eql \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST_NOT equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to equal 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to equal 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to equal 42."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD_NOT raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to raise_exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise_exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD_NOT raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to raise_exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise_exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD_NOT eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to eql \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD_NOT equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to equal 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to equal 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to equal 42."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise_exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise_exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to eql \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to eql \"foo\"."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to equal 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: expected \"boo\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to equal 42."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to raise_exception NoMethodError."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to raise_exception ArgumentError."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to eql \"foo\".\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to eql \"foo\"."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: expected \"boo\" to equal 42.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: expected \"boo\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: expected \"boo\" to equal 42."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MAY! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to raise_exception NoMethodError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise_exception NoMethodError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MAY! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to raise_exception ArgumentError."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to raise_exception ArgumentError."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MAY! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to eql \"foo\".\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to eql \"foo\"."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to eql \"foo\"."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MAY! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: expected \"boo\" to equal 42.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "Failure: expected \"boo\" to equal 42."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: expected \"boo\" to equal 42."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST_NOT! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to raise_exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise_exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST_NOT! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to raise_exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise_exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST_NOT! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to eql \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.MUST_NOT! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to equal 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: expected \"boo\" not to equal 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to equal 42."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD_NOT! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise_exception NoMethodError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to raise_exception NoMethodError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise_exception NoMethodError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD_NOT! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to raise_exception ArgumentError.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to raise_exception ArgumentError."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to raise_exception ArgumentError."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD_NOT! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to eql \"foo\".\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to eql \"foo\"."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to eql \"foo\"."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".gsub!("f", "b") }.SHOULD_NOT! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != String
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: expected \"boo\" not to equal 42.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: expected \"boo\" not to equal 42."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: expected \"boo\" not to equal 42."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NoMethodError
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NoMethodError
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MAY raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NoMethodError
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :MAY, valid: true)"
raise if actual.level != :MAY
raise if actual.message != "Success: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MAY raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "I"
raise if actual.colored_char != "\e[36mI\e[0m"
raise if actual.colored_string != "\e[36m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💡"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != true
raise if actual.inspect != "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :info
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MAY eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "I"
raise if actual.colored_char != "\e[36mI\e[0m"
raise if actual.colored_string != "\e[36m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💡"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != true
raise if actual.inspect != "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :info
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MAY equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "I"
raise if actual.colored_char != "\e[36mI\e[0m"
raise if actual.colored_string != "\e[36m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💡"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != true
raise if actual.inspect != "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :info
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST_NOT raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NoMethodError
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST_NOT raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST_NOT eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST_NOT equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD_NOT raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NoMethodError
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD_NOT raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD_NOT eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD_NOT equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NoMethodError
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NoMethodError
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MAY! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NoMethodError
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :MAY, valid: true)"
raise if actual.level != :MAY
raise if actual.message != "Success: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MAY! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "I"
raise if actual.colored_char != "\e[36mI\e[0m"
raise if actual.colored_string != "\e[36m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💡"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != true
raise if actual.inspect != "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :info
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MAY! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "I"
raise if actual.colored_char != "\e[36mI\e[0m"
raise if actual.colored_string != "\e[36m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💡"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != true
raise if actual.inspect != "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :info
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MAY! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "I"
raise if actual.colored_char != "\e[36mI\e[0m"
raise if actual.colored_string != "\e[36m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💡"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != true
raise if actual.inspect != "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :info
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST_NOT! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NoMethodError
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST_NOT! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST_NOT! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.MUST_NOT! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD_NOT! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NoMethodError
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD_NOT! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD_NOT! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".boom }.SHOULD_NOT! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mNoMethodError\e[22m: undefined method `boom' for \"foo\":String.\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != NoMethodError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "NoMethodError: undefined method `boom' for \"foo\":String."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != ArgumentError
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != ArgumentError
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MAY raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MAY raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != ArgumentError
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, level: :MAY, valid: true)"
raise if actual.level != :MAY
raise if actual.message != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MAY eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MAY equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST_NOT raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST_NOT raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != ArgumentError
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST_NOT eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST_NOT equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD_NOT raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD_NOT raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != ArgumentError
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD_NOT eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD_NOT equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != ArgumentError
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, level: :MUST, valid: true)"
raise if actual.level != :MUST
raise if actual.message != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != ArgumentError
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, level: :SHOULD, valid: true)"
raise if actual.level != :SHOULD
raise if actual.message != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MAY! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MAY! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != ArgumentError
raise if actual.char != "."
raise if actual.colored_char != "\e[32m.\e[0m"
raise if actual.colored_string != "\e[32m\e[1mSuccess\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "✅"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != TrueClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, level: :MAY, valid: true)"
raise if actual.level != :MAY
raise if actual.message != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != true
raise if actual.success? != true
raise if actual.to_s != "Success: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :success
raise if actual.valid? != true
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MAY! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MAY! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise if actual.level != :MAY
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != false
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST_NOT! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST_NOT! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != ArgumentError
raise if actual.char != "F"
raise if actual.colored_char != "\e[35mF\e[0m"
raise if actual.colored_string != "\e[35m\e[1mFailure\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "❌"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != true
raise if actual.failure? != true
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "Failure: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "Failure: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :failure
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST_NOT! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.MUST_NOT! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, level: :MUST, valid: false)"
raise if actual.level != :MUST
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD_NOT! raise_exception(NoMethodError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD_NOT! raise_exception(ArgumentError)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != ArgumentError
raise if actual.char != "W"
raise if actual.colored_char != "\e[33mW\e[0m"
raise if actual.colored_string != "\e[33m\e[1mWarning\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "⚠️"
raise if actual.error.class != NilClass
raise if actual.error? != false
raise if actual.failed? != false
raise if actual.failure? != false
raise if actual.got.class != FalseClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "Warning: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != true
raise if actual.success? != false
raise if actual.to_s != "Warning: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :warning
raise if actual.valid? != false
raise if actual.warning? != true

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD_NOT! eql("foo")
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false

# ------------------------------------------------------------------------------

actual = begin
  begin
    it { "foo".empty?(4) }.SHOULD_NOT! equal(42)
  rescue ::Spectus::Result::Fail => e
    e
  end
end

raise if actual.actual.class != NilClass
raise if actual.char != "E"
raise if actual.colored_char != "\e[31mE\e[0m"
raise if actual.colored_string != "\e[31m\e[1mArgumentError\e[22m: wrong number of arguments (given 1, expected 0).\e[0m"
raise if actual.emoji != "💥"
raise if actual.error.class != ArgumentError
raise if actual.error? != true
raise if actual.failed? != true
raise if actual.failure? != false
raise if actual.got.class != NilClass
raise if actual.info? != false
raise if actual.inspect != "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, level: :SHOULD, valid: false)"
raise if actual.level != :SHOULD
raise if actual.message != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.negate? != true
raise if actual.passed? != false
raise if actual.success? != false
raise if actual.to_s != "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise if actual.to_sym != :error
raise if actual.valid? != false
raise if actual.warning? != false
