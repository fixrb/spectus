module Spectus
  # This class contains a challenge to apply against an object.
  #
  # @api public
  #
  class Challenge
    # Initialize the challenge class.
    #
    # @param method [#to_sym] The identifier of a method.
    # @param args   [Array]   The arguments of the method.
    def initialize(method, *args)
      @method = method.to_sym
      @args   = args
    end

    # @param object [#public_send] The subject of the challenge.
    #
    # @return [BasicObject] The result of the challenge.
    def to(object)
      object.public_send(@method, *@args)
    end

    # Properties of the challenge.
    #
    # @return [Hash] The properties of the challenge.
    def to_h
      {
        method: @method,
        args:   @args
      }
    end
  end
end
