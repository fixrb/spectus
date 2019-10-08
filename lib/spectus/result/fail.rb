# frozen_string_literal: true

require_relative 'base'

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is false.
    class Fail < ::StandardError
      include Base

      # The value of the expectation of the spec.
      #
      # @return [Boolean] The spec was false.
      def result?
        false
      end

      # The state of failure.
      #
      # @return [Boolean] The test was a failure.
      def failure?
        error.nil?
      end

      # The state of error.
      #
      # @return [Boolean] The test was an error.
      def error?
        !failure?
      end

      # Identify the state of the result.
      #
      # @return [Symbol] The identifier of the state.
      def to_sym
        failure? ? :failure : :error
      end

      # Express the result with one char.
      #
      # @param color [Boolean] Enable the color.
      #
      # @return [String] The char that identify the result.
      def to_char(color = false)
        if failure?
          color ? "\e[35mF\e[0m" : 'F'
        else
          color ? "\e[31mE\e[0m" : 'E'
        end
      end
    end
  end
end
