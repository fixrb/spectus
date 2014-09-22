module Spectus

  # This class is responsible for reporting the result of the expectation.
  class Reporter
    attr_reader :negated, :matcher, :expected, :exception

    # @api private
    def initialize negated, matcher, expected, result
      @negated    = negated
      @matcher    = matcher
      @expected   = expected
      @pass       = result.equal? true
      @exception  = ([ true, false ].include?(result) ? nil : result)

      freeze
    end

    # Returns true if the expectation is true. False otherwise.
    def pass?
      @pass
    end

    # Returns the state of the expectation.
    def state
      if pass?
        :success
      elsif @exception.nil?
        :failure
      else
        :error
      end
    end

    # Returns a char as the result of the expectation.
    def to_s
      if pass?
        '.'
      elsif @exception.nil?
        'F'
      else
        'E'
      end
    end
  end
end
