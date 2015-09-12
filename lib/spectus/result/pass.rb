require_relative 'base'

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is true.
    class Pass
      include Base

      # @!attribute [r] message
      #
      # @return [String] The message that describe the state.
      attr_reader :message

      # The value of the expectation of the spec.
      #
      # @return [Boolean] The spec was true.
      def result?
        true
      end

      # Identify the state of the result.
      #
      # @param color [Boolean] Enable the color.
      #
      # @return [String] The char that identify the state of the result.
      def to_char(color = false)
        if got
          color ? "\e[32m.\e[0m" : '.'
        else
          color ? "\e[33mI\e[0m" : 'I'
        end
      end
    end
  end
end
