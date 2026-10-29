# frozen_string_literal: true

require "defi"

module Spectus
  # Texts read from user code, which may raise, return anything or hold
  # bytes in any encoding: each one comes back as a frozen String in UTF-8,
  # or as a stated fallback.
  #
  # @api private
  module Text
    # @param object [Object] any object, a BasicObject included
    # @return [String] its inspect, or `an object of CLASS` when the inspect
    #   raises or is not a String (`an anonymous class` without a name)
    def self.object(object)
      text = object.inspect
      ::String === text ? utf8(text) : fallback(object)
    rescue *::Defi::Value::RAISED
      fallback(object)
    end

    # @param exception [Exception]
    # @return [Array(String, String, Array<String>)] the name of its class
    #   (`an anonymous exception` without a name), its message (`a message
    #   that cannot be read` when it raises or is not a String) and its
    #   backtrace, `nil` in place of the latter when it has none, it raises
    #   or it is not an Array of Strings
    def self.exception(exception)
      [class_name(exception) || "an anonymous exception", message(exception), backtrace(exception)]
    end

    # The text of an object whose inspect cannot be read.
    def self.fallback(object)
      "an object of #{class_name(object) || "an anonymous class"}".freeze
    end

    # The name of the class of an object, read as Kernel and Module do, or
    # nil for an anonymous class.
    def self.class_name(object)
      klass = ::Kernel.instance_method(:class).bind_call(object)
      name = ::Module.instance_method(:name).bind_call(klass)
      name && utf8(name)
    end

    # The message of an exception, which user code may redefine.
    def self.message(exception)
      text = exception.message
      ::String === text ? utf8(text) : "a message that cannot be read"
    rescue *::Defi::Value::RAISED
      "a message that cannot be read"
    end

    # The backtrace of an exception, which user code may redefine too: a
    # plain copy of the Array is asked, not a subclass.
    def self.backtrace(exception)
      lines = exception.backtrace
      return unless ::Array === lines

      lines = ::Array.new(lines)
      return unless lines.all?(::String)

      lines.map { |line| utf8(line) }.freeze
    rescue *::Defi::Value::RAISED
      nil
    end

    # @param text [String] a String, in any encoding, of any class
    # @return [String] a plain copy, valid UTF-8, frozen: invalid bytes and
    #   characters UTF-8 cannot hold become U+FFFD, and a String in an
    #   encoding Ruby cannot convert is read as UTF-8 bytes
    def self.utf8(text)
      copy = ::String.new(text)
      begin
        copy.encode(::Encoding::UTF_8, invalid: :replace, undef: :replace)
      rescue ::EncodingError
        copy.force_encoding(::Encoding::UTF_8).scrub
      end.freeze
    end

    private_class_method :fallback, :class_name, :message, :backtrace
  end

  private_constant :Text
end
