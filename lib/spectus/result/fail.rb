# frozen_string_literal: true

require_relative "common"

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is false.
    class Fail < ::StandardError
      include Common

      # @raise [Fail] A failed spec result.
      def self.call(**details)
        raise new(**details)
      end

      # Did the test fail?
      #
      # @return [Boolean] The spec passed or failed?
      def failed?
        true
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
      def char
        if failure?
          "F"
        else
          "E"
        end
      end

      # Express the result with one emoji.
      #
      # @return [String] The emoji that identify the result.
      def emoji
        if failure?
          "❌"
        else
          "💥"
        end
      end
    end
  end
end
