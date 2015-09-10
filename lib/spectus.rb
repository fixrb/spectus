require_relative File.join 'spectus', 'expectation_target'

# Namespace for the Spectus library.
#
# @api public
#
# @example 42 MUST be equal to 42
#   Spectus.this { 42 }.MUST Equal: 42 # => #<Spectus::Result::Pass...>
module Spectus
  # Expectations are built with this method.
  #
  # @example _Absolute requirement_ definition
  #   this { 42 }.MUST Equal: 42 # => #<Spectus::Result::Pass...>
  #
  # @param input [Proc] The code to test.
  #
  # @return [ExpectationTarget] The expectation target.
  def self.this(&input)
    ExpectationTarget.new(&input)
  end
end
