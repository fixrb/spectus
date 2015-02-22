require_relative 'matcher'

module Spectus
  # This class evaluate the expectation with the passed block.
  #
  # @api private
  #
  class Sandbox
    attr_reader :exception, :got

    # Execute the untested code from the passed block against the definition.
    #
    # @param [Hash] definition
    # @param [Boolean] negate
    # @yieldparam actual the value which is compared with the expected value.
    def initialize(definition, negate, &actual)
      @got = negate ^ Matcher.pass?(definition, &actual)
    rescue => e
      @exception = e
    end

    # Return the result.
    #
    # @return [Boolean] Report if the test was true or false.
    def pass?
      if defined?(@exception)
        false
      else
        @got
      end
    end
  end
end
