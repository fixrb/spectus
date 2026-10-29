# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "spectus")
require_relative File.join("support", "matchers")

# The texts of a result come from user code, which may raise, answer
# anything or write any bytes: each one is read under guard, and comes back
# as a frozen String in UTF-8.
accept = matcher("be accepted") { |&block| block.call; true } # rubocop:disable Style/Semicolon
actual = ->(value) { Spectus.must(accept).call { value }.actual }

# The actual value, as inspect writes it.
raise unless actual.call(42) == "42"
raise unless actual.call(nil) == "nil" && actual.call("a") == "\"a\""
[RuntimeError, NotImplementedError].each do |klass|
  loud = Object.new
  loud.define_singleton_method(:inspect) { raise klass }
  raise unless actual.call(loud) == "an object of Object"
end
interrupting = Object.new
def interrupting.inspect = raise(Interrupt)
raise unless raised { actual.call(interrupting) }.instance_of?(Interrupt)
mute = Object.new
def mute.inspect = nil
raise unless actual.call(mute) == "an object of Object"
raise unless actual.call(BasicObject.new) == "an object of BasicObject"
anonymous = Class.new.new
def anonymous.inspect = 1
raise unless actual.call(anonymous) == "an object of an anonymous class"
named = Class.new { def self.name = "Fake" }.new
def named.inspect = 1
raise unless actual.call(named) == "an object of an anonymous class"
nested = Class.new(BasicObject) { def inspect = Object.new }.new
raise unless actual.call(nested) == "an object of an anonymous class"
latin = Object.new
def latin.inspect = "caf\xE9".dup.force_encoding("ISO-8859-1")
raise unless actual.call(latin) == "café"
broken = Object.new
def broken.inspect = "caf\xE9 \xFF".dup.force_encoding("UTF-8")
raise unless actual.call(broken) == "caf� �"
binary = Object.new
def binary.inspect = "caf\xC3\xA9 \xFF".b
raise unless actual.call(binary) == "caf�� �"
dummy = Object.new
def dummy.inspect = "caf\xC3\xA9".dup.force_encoding("UTF-7")
raise unless actual.call(dummy) == "café"
invalid_dummy = Object.new
def invalid_dummy.inspect = "caf\xE9".dup.force_encoding("UTF-7")
raise unless actual.call(invalid_dummy) == "caf\uFFFD"
# What inspect answers must be a String, not something that converts to one.
convertible = Object.new
def convertible.to_str = "converted"
def convertible.is_a?(*) = true
def convertible.instance_of?(*) = true
pretending = Object.new
pretending.define_singleton_method(:inspect) { convertible }
raise unless actual.call(pretending) == "an object of Object"
subclass = Class.new(String) { def encode(*) = raise("hijacked") }
own = Object.new
own.define_singleton_method(:inspect) { subclass.new("plain") }
text = actual.call(own)
raise unless text == "plain" && text.instance_of?(String) && text.frozen? && text.encoding == Encoding::UTF_8
# The String inspect answers is copied, not kept.
same = Object.new
kept = +"42"
same.define_singleton_method(:inspect) { kept }
raise unless actual.call(same) == "42" && !actual.call(same).equal?(kept)

# The exception: its class, its message and its backtrace.
error = ->(exception) { Spectus.must(matcher { raise exception }).call { 1 } }
result = error.call(KeyError.new("missing"))
raise unless result.error_class == "KeyError" && result.error_message == "missing" && result.actual.nil?
raise unless result.backtrace.first.include?("test_text.rb")
nameless = Class.new(StandardError)
result = error.call(nameless.new("nameless"))
raise unless result.error_class == "an anonymous exception" && result.error_message == "nameless"
raise unless result.to_s == "Error: an anonymous exception: nameless"
class SpectusTestError < StandardError
  def message = raise("no message")
  def backtrace = raise("no backtrace")
end
result = error.call(SpectusTestError.new)
raise unless result.error_class == "SpectusTestError" && result.error_message == "a message that cannot be read"
raise unless result.backtrace.nil?
class SpectusOddError < StandardError
  def message = 42
  def backtrace = "not an array"
end
result = error.call(SpectusOddError.new)
raise unless result.error_message == "a message that cannot be read" && result.backtrace.nil?
class SpectusConvertibleError < StandardError
  def message = Object.new.tap { |o| o.define_singleton_method(:to_str) { "converted" } }
  def backtrace = [Object.new.tap { |o| o.define_singleton_method(:to_str) { "converted" } }]
end
result = error.call(SpectusConvertibleError.new)
raise unless result.error_message == "a message that cannot be read" && result.backtrace.nil?
class SpectusConvertibleTraceError < StandardError
  def backtrace = Object.new.tap { |o| o.define_singleton_method(:to_ary) { ["converted"] } }
end
raise unless error.call(SpectusConvertibleTraceError.new("trace")).backtrace.nil?
class SpectusMixedError < StandardError
  def backtrace = ["a line", 2]
end
raise unless error.call(SpectusMixedError.new("mixed")).backtrace.nil?
class SpectusLinesError < StandardError
  def backtrace = ["caf\xE9".dup.force_encoding("ISO-8859-1")]
end
raise unless error.call(SpectusLinesError.new("lines")).backtrace == ["café"]
class SpectusUnfinishedError < StandardError
  def message = raise(NotImplementedError)
  def backtrace = raise(NotImplementedError)
end
result = error.call(SpectusUnfinishedError.new)
raise unless result.error_message == "a message that cannot be read" && result.backtrace.nil?
class SpectusInterruptingError < StandardError
  def message = raise(Interrupt)
end
raise unless raised { error.call(SpectusInterruptingError.new) }.instance_of?(Interrupt)
class SpectusInterruptingTraceError < StandardError
  def backtrace = raise(Interrupt)
end
raise unless raised { error.call(SpectusInterruptingTraceError.new) }.instance_of?(Interrupt)
# A subclass of Array is copied before it is asked anything.
class SpectusTrace < Array
  def all?(*) = true
  def map = Object.new.tap { |o| o.define_singleton_method(:inspect) { "pwned" } }
end

class SpectusSubclassTraceError < StandardError
  def backtrace = SpectusTrace.new(["a line", 2])
end
raise unless error.call(SpectusSubclassTraceError.new("sub")).backtrace.nil?
class SpectusPlainSubclassTraceError < StandardError
  def backtrace = SpectusTrace.new(["a line"])
end
result = error.call(SpectusPlainSubclassTraceError.new("sub"))
raise unless result.backtrace == ["a line"] && result.backtrace.instance_of?(Array) && Ractor.shareable?(result)
class SpectusEmptyTraceError < StandardError
  def backtrace = []
end
result = error.call(SpectusEmptyTraceError.new("empty"))
raise unless result.backtrace == [] && result.backtrace.frozen?
result = error.call(RuntimeError.new("caf\xE9".dup.force_encoding("ISO-8859-1")))
raise unless result.error_message == "café" && result.error_message.encoding == Encoding::UTF_8
# The class is read as Kernel does, whatever the exception says.
class SpectusLiarError < StandardError
  def class = Integer
  def inspect = "nothing to see"
end
raise unless error.call(SpectusLiarError.new("liar")).error_class == "SpectusLiarError"
