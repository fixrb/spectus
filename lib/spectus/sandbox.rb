require 'expect'

module Spectus
  # This class evaluate the expectation with the passed block.
  #
  class Sandbox < BasicObject
    attr_reader :exception, :got

    # Execute the untested code from the passed block against the definition.
    #
    # @param [Hash] definition
    def initialize(definition, &actual)
      @got = ::Expect.this(&actual).to(definition)
    rescue => e
      @exception = e
    end

    # Return the result as a positive or a negative assertion.
    #
    # @param [Boolean] negate
    #
    # @return [Boolean] Report if the test was true or false.
    def pass?(negate)
      if defined?(@exception)
        false
      else
        negate ^ @got
      end
    end
  end
end
