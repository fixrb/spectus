# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "spectus")
require_relative File.join("support", "matchers")
require "matchi"

# A requirement is data, frozen, with a valid level, negation and matcher.
eq = Matchi::Eq.new(42)
requirement = Spectus::Requirement.new(level: :MUST, negate: false, matcher: eq)
raise unless requirement.level == :MUST && requirement.negate.equal?(false) && requirement.matcher.equal?(eq)
raise unless requirement.frozen? && requirement == Spectus::Requirement.new(level: :MUST, negate: false, matcher: eq)
raise unless requirement.with(negate: true).negate.equal?(true)
raise if requirement.matcher.frozen?
# A copy is checked as the original was.
raise unless raised { requirement.with(level: :X) }.instance_of?(ArgumentError)
raise unless raised { requirement.with(negate: 1) }.instance_of?(ArgumentError)
# A level is one of the three symbols, not something that hashes like one.
alike = Object.new
def alike.hash = :MUST.hash
def alike.eql?(*) = true
[:must, :MAY.to_s, nil, Object.new, alike].each do |level|
  error = raised { Spectus::Requirement.new(level:, negate: false, matcher: eq) }
  raise unless error.instance_of?(ArgumentError) && error.message == "the level must be :MUST, :SHOULD or :MAY"
end
[nil, 1, "true"].each do |negate|
  error = raised { Spectus::Requirement.new(level: :MUST, negate:, matcher: eq) }
  raise unless error.instance_of?(ArgumentError) && error.message == "negate must be true or false"
end
error = raised { Spectus::Requirement.new(level: :MAY, negate: true, matcher: eq) }
raise unless error.instance_of?(ArgumentError) && error.message == "a MAY has no negative form"
[Object.new, BasicObject.new, nil].each do |matcher|
  error = raised { Spectus::Requirement.new(level: :MAY, negate: false, matcher:) }
  raise unless error.instance_of?(ArgumentError) && error.message == "the matcher must respond to match?"
end
# A matcher that answers match? through method_missing is accepted.
ghost = Object.new
def ghost.respond_to_missing?(name, _include_all = false) = name == :match?
def ghost.method_missing(name, *) = name == :match? ? yield == 1 : super
def ghost.to_s = "haunt"
raise unless Spectus.must(ghost).call { 1 }.to_s == "Success: expected 1 to haunt"
error = raised { requirement.call }
raise unless error.instance_of?(ArgumentError) && error.message == "a block must be given"

# Each level, with and without negation, on a match that is true and false.
table = {
  [:MUST, false, true]    => :success,
  [:MUST, false, false]   => :failure,
  [:MUST, true, true]     => :failure,
  [:MUST, true, false]    => :success,
  [:SHOULD, false, true]  => :success,
  [:SHOULD, false, false] => :warning,
  [:SHOULD, true, true]   => :warning,
  [:SHOULD, true, false]  => :success,
  [:MAY, false, true]     => :success,
  [:MAY, false, false]    => :failure
}
table.each do |(level, negate, answer), outcome|
  result = Spectus::Requirement.new(level:, negate:, matcher: answering(answer)).call { 42 }
  raise [level, negate, answer].inspect unless result.outcome == outcome
  raise unless result.level == level && result.negate.equal?(negate) && result.actual == "42"
  raise unless result.description == "match" && result.error_class.nil? && result.error_message.nil?
  raise unless result.backtrace.nil?
end

# A method the value does not have is an error, unless the level is MAY,
# where the method is allowed to be missing; another exception is an error at every
# level. Shown with matchi's matchers, which call the method with
# public_send, so that a private method is missing too.
missing = Matchi::Predicate.new(:be_foo)
private_method = Matchi::Predicate.new(:be_hidden)
hidden = Object.new
hidden.singleton_class.define_method(:hidden?) { true }
hidden.singleton_class.send(:private, :hidden?)
broken = matcher { |&block| block.call.fetch(:missing) }
{ MUST: :error, SHOULD: :error, MAY: :info }.each do |level, outcome|
  result = Spectus::Requirement.new(level:, negate: false, matcher: missing).call { 42 }
  raise [level, result].inspect unless result.outcome == outcome
  raise unless result.error_class == "NoMethodError" && result.error_message.start_with?("undefined method")
  raise unless result.actual == "42" && result.backtrace.first.include?("matchi")
  result = Spectus::Requirement.new(level:, negate: false, matcher: private_method).call { hidden }
  raise unless result.outcome == outcome
  result = Spectus::Requirement.new(level:, negate: false, matcher: broken).call { {} }
  raise unless result.outcome == :error && result.error_class == "KeyError"
  raise unless result.error_message == "key not found: :missing"
  raise unless result.actual == "{}" && result.backtrace.first.include?("test_requirement.rb")
end
raise unless Spectus.must_not(missing).call { 42 }.outcome == :error
raise unless Spectus.should_not(missing).call { 42 }.outcome == :error
raise unless Spectus.must_not(broken).call { {} }.outcome == :error
raise unless Spectus.should_not(broken).call { {} }.outcome == :error
# A matcher that claims to respond to match? without having it is refused:
# Kernel is asked, not the matcher.
fake = Object.new
def fake.respond_to?(*) = true
error = raised { Spectus.must(fake) }
raise unless error.instance_of?(ArgumentError) && error.message == "the matcher must respond to match?"

# A missing method is a NoMethodError whose receiver is the very value the
# block produced; not one raised by the block itself, nor one on another
# object, nor one without a receiver, whatever the receiver says of itself;
# nor one on the exception the block raised, nor one when the matcher did
# not call the block.
raise unless Spectus.may(Matchi::Predicate.new(:be_empty)).call { nil.upcase }.outcome == :error
rescuing = matcher do |&block|
  block.call
rescue ZeroDivisionError => e
  e.foo
end
raise unless Spectus.may(rescuing).call { 1 / 0 }.outcome == :error
raise unless Spectus.may(matcher { nil.foo }).call { 1 }.outcome == :error
result = Spectus.may(matcher { |&block| block.call.foo }).call { BasicObject.new }
raise unless result.outcome == :info && result.actual == "an object of BasicObject"
# The value is the last one the block returned.
raise unless Spectus.may(matcher { |&block| block.call; block.call.foo }).call { Object.new }.outcome == :info # rubocop:disable Style/Semicolon
first = matcher do |&block|
  value = block.call
  block.call
  value.foo
end
raise unless Spectus.may(first).call { Object.new }.outcome == :error
raise unless Spectus.may(matcher { |&block| block.call; nil.foo }).call { 42 }.outcome == :error # rubocop:disable Style/Semicolon
by_hand = matcher { |&block| block.call; raise NoMethodError, "by hand" } # rubocop:disable Style/Semicolon
raise unless Spectus.may(by_hand).call { 42 }.outcome == :error
raise unless Spectus.may(by_hand).call { nil }.outcome == :error
liar = Object.new
liar.define_singleton_method(:equal?) { |_other| true }
liar.define_singleton_method(:==) { |_other| true }
raise unless Spectus.may(matcher { |&block| block.call; nil.foo }).call { liar }.outcome == :error # rubocop:disable Style/Semicolon
raise unless Spectus.may(matcher { |&block| block.call; liar.foo }).call { Object.new }.outcome == :error # rubocop:disable Style/Semicolon
raise unless Spectus.may(matcher { |&block| block.call.foo }).call { liar }.outcome == :info
touchy = Object.new
touchy.define_singleton_method(:equal?) { |_other| raise "do not ask" }
raise unless Spectus.may(matcher { |&block| block.call.foo }).call { touchy }.outcome == :info
subclass = Class.new(NoMethodError)
sub = matcher { |&block| raise subclass.new("sub", :foo, receiver: block.call) }
raise unless Spectus.may(sub).call { 42 }.outcome == :info
name = matcher { |&block| raise NameError.new("name", :foo, receiver: block.call) }
raise unless Spectus.may(name).call { 42 }.outcome == :error
# A method implemented, which calls a missing one on self, passes for
# missing; the same with a bare name is a NameError, an error.
positive = Matchi::Predicate.new(:be_positive)
on_self = Object.new
def on_self.positive? = self.foo # rubocop:disable Style/RedundantSelf
bare = Object.new
def bare.positive? = foo
raise unless Spectus.may(positive).call { on_self }.outcome == :info
raise unless Spectus.may(positive).call { bare }.outcome == :error

# match? must answer true or false: anything else is an error, with and
# without negation.
[3, nil, "true", :no].each do |answer|
  [Spectus.must(answering(answer)), Spectus.must_not(answering(answer)), Spectus.may(answering(answer))].each do |req|
    result = req.call { 42 }
    raise unless result.outcome == :error && result.error_class == "TypeError" && result.backtrace.nil?
    raise unless result.error_message == "match? answered #{answer.inspect}, not true or false"
    raise unless result.error_message.frozen? && Ractor.shareable?(result)
    raise unless result.to_s == "Error: TypeError: match? answered #{answer.inspect}, not true or false"
  end
end
# An answer that claims to be true is not, and is written under guard.
pretender = Object.new
pretender.define_singleton_method(:==) { |_other| true }
pretender.define_singleton_method(:inspect) { raise "no" }
result = Spectus.must(answering(pretender)).call { 42 }
raise unless result.outcome == :error
raise unless result.error_message == "match? answered an object of Object, not true or false"

# The actual value is what the block produced: the value returned, or the
# exception it raised, whether the matcher rescued it or not; the last one
# when the matcher calls the block twice; nothing when it does not call it.
result = Spectus.must(Matchi::RaiseException.new(ZeroDivisionError)).call { 1 / 0 }
raise unless result.outcome == :success && result.actual == "#<ZeroDivisionError: divided by 0>"
raise unless result.to_s == "Success: expected #<ZeroDivisionError: divided by 0> to raise exception ZeroDivisionError"
result = Spectus.must(Matchi::Eq.new(42)).call { 1 / 0 }
raise unless result.outcome == :error && result.actual == "#<ZeroDivisionError: divided by 0>"
raise unless result.error_class == "ZeroDivisionError" && result.error_message == "divided by 0"
raise unless result.backtrace.first.include?("test_requirement.rb")
raise unless result.to_s == "Error: ZeroDivisionError: divided by 0"
twice = matcher { |&block| block.call; block.call == 2 } # rubocop:disable Style/Semicolon
count = 0
result = Spectus.must(twice).call { count += 1 }
raise unless result.outcome == :success && result.actual == "2"
# The block is called without arguments: a lambda that wants some raises.
result = Spectus.must(Matchi::Eq.new(1)).call(&->(argument) { argument })
raise unless result.outcome == :error && result.error_class == "ArgumentError"
raise unless result.actual.start_with?("#<ArgumentError: wrong number of arguments")
raise unless Spectus.must(Matchi::Eq.new("42")).call(&42.method(:to_s)).outcome == :success # rubocop:disable Performance/MethodObjectAsBlock
silent = matcher("be left alone") { true }
result = Spectus.must(silent).call { raise "never run" }
raise unless result.outcome == :success && result.actual.nil? && result.to_s == "Success: expected to be left alone"
raise unless Spectus.must_not(silent).call { 1 }.to_s == "Failure: expected not to be left alone"

# An exception Defi does not keep leaves no actual value, even when the
# matcher rescues it.
expecting = matcher("raise Interrupt") do |&block|
  block.call
  false
rescue Interrupt
  true
end
result = Spectus.must(expecting).call { raise Interrupt }
raise unless result.outcome == :success && result.actual.nil? && result.to_s == "Success: expected to raise Interrupt"

# The exception raised again inside the matcher is the same object, with its
# own cause.
caught = nil
with_cause = matcher do |&block|
  block.call
rescue KeyError => e
  caught = e
  true
end
raise unless Spectus.must(with_cause).call { {}.fetch(:a) }.outcome == :success
raise unless caught.instance_of?(KeyError) && caught.cause.nil?
Spectus.must(with_cause).call do
  raise "inner"
rescue RuntimeError
  raise KeyError, "outer"
end
raise unless caught.message == "outer" && caught.cause.message == "inner"

# The exceptions Defi keeps end in the result; the others go through.
[StandardError, NotImplementedError, SystemExit].each do |klass|
  name = klass.name
  result = Spectus.must(Matchi::Eq.new(1)).call { raise klass }
  raise unless result.outcome == :error && result.error_class == name
  result = Spectus.must(matcher { raise klass }).call { 1 }
  raise unless result.outcome == :error && result.error_class == name && result.actual.nil?
end
deep = matcher { |&block| block.call }
recurse = nil
recurse = -> { recurse.call }
result = Spectus.must(deep).call { recurse.call }
raise unless result.outcome == :error && result.error_class == "SystemStackError"
result = Spectus.must(matcher { recurse.call }).call { 1 }
raise unless result.outcome == :error && result.error_class == "SystemStackError" && result.actual.nil?
result = Spectus.must(Matchi::Eq.new(1)).call { exit 3 }
raise unless result.outcome == :error && result.error_class == "SystemExit" && result.error_message == "exit"
[Interrupt, NoMemoryError, SecurityError].each do |klass|
  raise unless raised { Spectus.must(Matchi::Eq.new(1)).call { raise klass } }.instance_of?(klass)
  raise unless raised { Spectus.must(matcher { raise klass }).call { 1 } }.instance_of?(klass)
end
signal = raised { Spectus.must(Matchi::Eq.new(1)).call { raise SignalException, "TERM" } }
raise unless signal.instance_of?(SignalException)
signal = raised { Spectus.must(matcher { raise SignalException, "TERM" }).call { 1 } }
raise unless signal.instance_of?(SignalException)
require "timeout"
error = raised { Timeout.timeout(0.05) { Spectus.must(Matchi::Eq.new(1)).call { sleep } } }
raise unless error.instance_of?(Timeout::Error)
error = raised { Timeout.timeout(0.05) { Spectus.must(matcher { sleep }).call { 1 } } }
raise unless error.instance_of?(Timeout::Error)

# The description is the to_s of the matcher, read at each call, before
# anything runs, and copied as valid UTF-8; it must be a String, not
# something that converts to one.
raise unless Spectus.must(Matchi::Eq.new("a")).call { "a" }.description == "eq \"a\""
counting = Object.new
def counting.match? = true
calls = 0
counting.define_singleton_method(:to_s) { "call #{calls += 1}" }
raise unless Spectus.must(counting).call { 1 }.description == "call 1"
raise unless Spectus.must(counting).call { 1 }.description == "call 2"
raise unless Spectus.must(matcher("caf\xE9".dup.force_encoding("ISO-8859-1")) { true }).call { 1 }.description == "café"
raise unless Spectus.must(matcher("caf\xE9".dup.force_encoding("UTF-8")) { true }).call { 1 }.description == "caf\uFFFD"
kept = +"desc"
result = Spectus.must(matcher(kept) { true }).call { 1 }
kept << "!"
raise unless result.description == "desc" && result.description.frozen? && result.description.instance_of?(String)
convertible = Object.new
def convertible.to_str = "converted"
def convertible.is_a?(*) = true
[nil, 42, :eq, convertible].each do |description|
  ran = false
  error = raised { Spectus.must(matcher(description) { |&block| ran = true; block.call }).call { ran = true } } # rubocop:disable Style/Semicolon
  raise unless error.instance_of?(TypeError) && error.message == "the to_s of the matcher must be a String"
  raise if ran
end
raising_to_s = Object.new
def raising_to_s.match? = true
def raising_to_s.to_s = raise(IOError, "no description")
error = raised { Spectus.must(raising_to_s).call { 1 } }
raise unless error.instance_of?(IOError) && error.message == "no description"
