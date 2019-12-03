# frozen_string_literal: true

require_relative 'common'

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is false.
    class Fail < ::StandardError
      include Common

      # The value of the expectation of the spec.
      #
      # @return [Boolean] The spec passed or failed?
      def pass?
        false
      end

      # The state of failure.
      #
      # @return [Boolean] The test was a failure?
      def failure?
        !error?
      end

      # The state of info.
      #
      # @return [Boolean] The test was an info?
      def info?
        false
      end

      # The state of warning.
      #
      # @return [Boolean] The test was a warning?
      def warning?
        false
      end

      # Identify the state of the result.
      #
      # @return [Symbol] The identifier of the state.
      def to_sym
        failure? ? :failure : :error
      end

      # Express the result with one char.
      #
      # @return [String] The char that identify the result.
      def to_s
        failure? ? "\e[35mF\e[0m" : "\e[31mE\e[0m"
      end
    end
  end
end
