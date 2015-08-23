require 'matchi'

module Spectus
  # This class evaluate the expectation with the passed block.
  #
  # @api private
  #
  class Sandbox
    # Execute the untested code from the passed block against the definition.
    #
    # @param [Array, Hash, Symbol] definition
    # @param [Boolean] negate
    # @param [#object_id] object the front object which is challenged.
    # @param [Symbol] meth the name of the method.
    # @param [Array] args the arguments of the method.
    def initialize(definition, negate, object, meth, *args)
      @got = negate ^ matcher(definition).matches? do
        @actual = object.public_send(meth, *args)
      end
    rescue => e
      @exception = e
    end

    # @!attribute [r] actual
    #
    # @return [#object_id] The value that the subject return through its
    #   challenge.
    attr_reader :actual

    # @!attribute [r] exception
    #
    # @return [#exception, nil] Any possible raised exception.
    attr_reader :exception

    # @!attribute [r] got
    #
    # @return [#object_id] The result of the boolean comparison between the
    #   actual value and the expected value.
    attr_reader :got

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
    # @param definition [Array, Hash, Symbol]
    #
    # @return [#matches?] the matcher
    def matcher(definition)
      params = Array(definition).flatten(1)
      Matchi.fetch(params.first, *params[1..-1])
    end
  end
end
