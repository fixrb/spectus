require_relative File.join 'spectus', 'expectation_target'

# Namespace for the Spectus library.
#
# @api public
#
# @example 42 MUST be equal to 42
#   Spectus.this { 42 }.MUST equal: 42 # => true
module Spectus
  # Expectations are built with this method.
  #
  # @api public
  #
  # @example Absolute requirement definition
  #   this { 42 }.MUST equal: 42 # => true
  #
  # @return [ExpectationTarget] the expectation target.
  def self.this(&input)
    ExpectationTarget.new(&input)
  end
end
