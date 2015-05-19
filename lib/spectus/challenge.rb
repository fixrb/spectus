module Spectus
  # This class evaluate the expectation with the passed block.
  #
  # @api private
  #
  class Challenge
    # A Query to the subject.
    #
    # @param [#to_sym] method_id the identifier of a method.
    # @param [Array] args the arguments of the method.
    def initialize(method_id, *args)
      @symbol = method_id.to_sym
      @args   = args
    end

    # @return [Symbol] the method to call on the subject.
    attr_reader :symbol

    # @return [Array] the parameters following the method.
    attr_reader :args
  end
end
