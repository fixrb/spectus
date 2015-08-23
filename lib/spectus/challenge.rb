module Spectus
  # This class contains a challenge to apply against an object.
  #
  # @api public
  #
  class Challenge
    # Initialize the challenge class.
    #
    # @param [#to_sym] method_id the identifier of a method.
    # @param [Array] args the arguments of the method.
    def initialize(method_id, *args)
      @symbol = method_id.to_sym
      @args   = args
    end

    # @!attribute [r] symbol
    #
    # @return [Symbol] The method to call on the subject.
    attr_reader :symbol

    # @!attribute [r] args
    #
    # @return [Array] The parameters following the method.
    attr_reader :args
  end
end
