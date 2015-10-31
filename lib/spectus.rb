require 'matchi'

# Namespace for the Spectus library.
#
# @api public
#
# @example It MUST equal 42.
#   require 'spectus'
#   it { 42 }.MUST equal 42 # => #<Spectus::Result::Pass...>
module Spectus
  Matchi.constants.each do |const|
    name = const
           .to_s
           .gsub(/::/, '/')
           .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
           .gsub(/([a-z\d])([A-Z])/, '\1_\2')
           .downcase

    # Define a method for the given matcher.
    #
    # @example Given the `Matchi::Equal` matcher, its method will be defined as:
    #   def equal(expected)
    #     Matchi::Equal.new(expected)
    #   end
    #
    # @return [#matches?] The matcher.
    define_method name do |*args|
      Matchi.const_get(const).new(*args)
    end
  end

  # Expectations are built with this method.
  #
  # @example An _absolute requirement_ definition.
  #   it { 42 }.MUST equal 42 # => #<Spectus::Result::Pass...>
  #
  # @param input [Proc] The code to test.
  #
  # @return [ExpectationTarget] The expectation target.
  def it(&input)
    ExpectationTarget.new(&input)
  end
end

require_relative File.join 'spectus', 'expectation_target'
