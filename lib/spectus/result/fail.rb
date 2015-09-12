require_relative 'base'

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is false.
    class Fail < StandardError
      include Base

      # The value of the expectation of the spec.
      #
      # @return [Boolean] The spec was false.
      def result?
        false
      end

      # Identify the state of the result.
      #
      # @param color [Boolean] Enable the color.
      #
      # @return [String] The char that identify the state of the result.
      def to_char(color = false)
        if error.nil?
          color ? "\e[35mF\e[0m" : 'F'
        else
          color ? "\e[31mE\e[0m" : 'E'
        end
      end
    end
  end
end
