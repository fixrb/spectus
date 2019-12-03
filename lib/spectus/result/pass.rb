# frozen_string_literal: true

require_relative 'common'

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is true.
    class Pass
      include Common

      # The value of the expectation of the spec.
      #
      # @return [Boolean] The spec passed or failed?
      def pass?
        true
      end

      # The state of failure.
      #
      # @return [Boolean] The test was a failure?
      def failure?
        false
      end

      # The state of info.
      #
      # @return [Boolean] The test was an info?
      def info?
        !error.nil?
      end

      # The state of warning.
      #
      # @return [Boolean] The test was a warning?
      def warning?
        got.equal?(false)
      end

      # Identify the state of the result.
      #
      # @return [Symbol] The identifier of the state.
      def to_sym
        return :success if success?
        return :warning if warning?

        :info
      end

      # Express the result with one char.
      #
      # @return [String] The char that identify the result.
      def to_s
        if success?
          "\e[32m.\e[0m"
        elsif warning?
          "\e[33mW\e[0m"
        else
          "\e[36mI\e[0m"
        end
      end
    end
  end
end
