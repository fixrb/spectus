# frozen_string_literal: true

require "expresenter"
require "test_tube"

module Spectus
  # Namespace for the requirement levels.
  module Requirement
    # Base class for implementing RFC 2119 requirement levels.
    #
    # This class provides the core functionality for running tests against
    # different requirement levels (MUST, SHOULD, MAY). It uses TestTube for
    # test execution and Expresenter for result presentation.
    #
    # @see https://github.com/fixrb/test_tube Test execution
    # @see https://github.com/fixrb/expresenter Result presentation
    class Base
      # Initialize the requirement level class.
      #
      # @param matcher [#match?] The matcher used to evaluate the test
      # @param negate [Boolean] When true, inverts the matcher's result
      #
      # @raise [ArgumentError] If matcher doesn't respond to match?
      def initialize(matcher:, negate:)
        raise ::ArgumentError, "matcher must respond to match?" unless matcher.respond_to?(:match?)

        @matcher = matcher
        @negate  = negate
      end

      # Execute the test and return its result.
      #
      # Runs the provided block through the matcher and evaluates the result
      # according to the requirement level's rules. The result is presented
      # through an Expresenter instance containing all test details.
      #
      # @example
      #   test = Base.new(matcher: SomeMatcher.new, negate: false)
      #   test.call { some_value }
      #   # => #<Expresenter::Pass actual: some_value, ...>
      #
      # @yield The block containing the code to test
      # @raise [::Expresenter::Fail] When the test fails
      # @return [::Expresenter::Pass] When the test passes
      #
      # @api public
      def call(&)
        test = ::TestTube.invoke(matcher: @matcher, negate: @negate, &)

        ::Expresenter.call(passed?(test)).with(
          actual:     test.actual,
          definition: @matcher.to_s,
          error:      test.error,
          got:        test.got,
          level:      self.class.level,
          negate:     @negate
        )
      end

      private

      # Determine if the test passed according to the requirement level's rules.
      #
      # This base implementation considers the test passed if the matcher
      # returned true. Subclasses may override this method to implement
      # specific requirement level rules.
      #
      # @param test [::TestTube::Base] The test execution state
      # @return [Boolean] true if the test passed, false otherwise
      def passed?(test)
        test.got.equal?(true)
      end
    end
  end
end
