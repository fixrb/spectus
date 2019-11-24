# frozen_string_literal: true

require 'matchi'

# Namespace for the Spectus library.
#
# @api public
#
# @example It MUST equal 42.
#   require 'spectus'
#   it { 42 }.MUST equal 42 # => #<Spectus::Result::Pass...>
module Spectus
  include ::Matchi::Helper

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

require_relative File.join('spectus', 'expectation_target')
