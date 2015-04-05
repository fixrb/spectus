require 'matchi'

module Spectus
  # This class evaluate the expectation with the passed block.
  #
  # @api private
  #
  class Sandbox
    attr_reader :actual, :exception, :got

    # Execute the untested code from the passed block against the definition.
    #
    # @param [Array, Hash, Symbol] definition
    # @param [Boolean] negate
    # @yieldparam actual the value which is compared with the expected value.
    def initialize(definition, negate, obj, meth, *args)
      @got = negate ^ matcher(definition).matches? do
        @actual = obj.public_send(meth, *args)
      end
    rescue => e
      @exception = e
    end

    # Report to the spec's requirement level if the test is true or false.
    #
    # @return [Boolean] Report if the test was true or false.
    def valid?
      if defined?(@exception)
        false
      else
        @got
      end
    end

    private

    # Load the matcher.
    #
    # @param [Array, Hash, Symbol] definition
    #
    # @return [#matches?] the matcher
    def matcher(definition)
      params = Array(definition).flatten(1)
      Matchi.fetch(params.first, *params[1..-1])
    end
  end
end
