# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "spectus")
require_relative File.join("support", "matchers")
require "matchi"

# A result is data: frozen, compared by value, marshalled and shared as it is.
success = Spectus.must(Matchi::Eq.new(42)).call { 42 }
raise unless success.frozen? && success.instance_of?(Spectus::Result)
raise unless success == Spectus.must(Matchi::Eq.new(42)).call { 42 }
raise unless success.to_h == { level: :MUST, negate: false, outcome: :success, description: "eq 42", actual: "42",
                               error_class: nil, error_message: nil, backtrace: nil }
raise unless Marshal.load(Marshal.dump(success)) == success
raise unless Ractor.shareable?(success)
error = Spectus.must(Matchi::Eq.new(42)).call { raise "boom" }
raise unless error.to_h.except(:backtrace) == { level: :MUST, negate: false, outcome: :error, description: "eq 42",
                                                 actual: "#<RuntimeError: boom>", error_class: "RuntimeError",
                                                 error_message: "boom" }
raise unless error.backtrace.frozen? && error.backtrace.all? { |line| line.frozen? && line.encoding == Encoding::UTF_8 }
raise unless Marshal.load(Marshal.dump(error)) == error
raise unless Ractor.shareable?(error)
[success.description, success.actual, error.error_class, error.error_message].each do |text|
  raise unless text.frozen? && text.encoding == Encoding::UTF_8 && text.instance_of?(String)
end

# A result can be built by hand.
built = Spectus::Result.new(level: :MAY, negate: false, outcome: :info, description: "be foo", actual: "42",
                            error_class: "NoMethodError", error_message: "undefined method", backtrace: nil)
raise unless built.outcome == :info && built.to_s == "Info: NoMethodError: undefined method"

# passed? is true for a success, a warning and an info.
passed = { success: true, warning: true, info: true, failure: false, error: false }
passed.each do |outcome, expected|
  result = built.with(outcome:)
  raise unless result.passed?.equal?(expected)
end

# The summary and the text of each outcome, with and without negation.
raise unless success.summary == "expected 42 to eq 42" && success.to_s == "Success: expected 42 to eq 42"
failure = Spectus.must_not(Matchi::Eq.new(42)).call { 42 }
raise unless failure.summary == "expected 42 not to eq 42" && failure.to_s == "Failure: expected 42 not to eq 42"
warning = Spectus.should(Matchi::Be.new(3)).call { 2 }
raise unless warning.to_s == "Warning: expected 2 to be 3"
raise unless Spectus.should_not(Matchi::Be.new(3)).call { 3 }.to_s == "Warning: expected 3 not to be 3"
info = Spectus.may(Matchi::Predicate.new(:be_foo)).call { 42 }
raise unless info.to_s.start_with?("Info: NoMethodError: undefined method")
raise unless info.summary == info.to_s.delete_prefix("Info: ")
raise unless error.to_s == "Error: RuntimeError: boom" && error.summary == "RuntimeError: boom"
raise unless Spectus.must_not(Matchi::Eq.new(1)).call { raise "x" }.to_s == "Error: RuntimeError: x"
# As inspect writes it under this locale: "é" or "\u00E9".
accented = Spectus.must(Matchi::Eq.new("é")).call { "é" }
raise unless accented.to_s == "Success: expected #{"é".inspect} to eq #{"é".inspect}"
raise unless Spectus.must(Matchi::Eq.new(42)).call { "a\nb" }.to_s == "Failure: expected \"a\\nb\" to eq 42"
raise unless Spectus.must(Matchi::Eq.new([1, :a])).call { [1, :a] }.to_s == "Success: expected [1, :a] to eq [1, :a]"
