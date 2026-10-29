# frozen_string_literal: true

module Spectus
  # How an expectation went: plain data, frozen, made of symbols, booleans
  # and frozen UTF-8 strings. A result can be marshalled, shared between
  # ractors, compared and printed without running any user code. It carries
  # the level and the negation of its requirement, so that a runner holding
  # results alone can still write the requirement they answer.
  #
  # @!attribute [r] level
  #   @return [Symbol] `:MUST`, `:SHOULD` or `:MAY`
  # @!attribute [r] negate
  #   @return [Boolean] whether the match was expected to fail
  # @!attribute [r] outcome
  #   @return [Symbol] `:success`, `:warning`, `:info`, `:failure` or `:error`
  # @!attribute [r] description
  #   @return [String] the matcher, as its `to_s` wrote it
  # @!attribute [r] actual
  #   @return [String, nil] the value the block produced, as its `inspect`
  #     wrote it, or the exception it raised (which is also the error when
  #     the matcher let it through); `nil` when the matcher did not call the
  #     block
  # @!attribute [r] error_class
  #   @return [String, nil] the class of the exception that came out of
  #     `match?`, or `TypeError` for an answer that was not true or false
  # @!attribute [r] error_message
  #   @return [String, nil] its message
  # @!attribute [r] backtrace
  #   @return [Array<String>, nil] its backtrace, when it has one
  Result = ::Data.define(:level, :negate, :outcome, :description, :actual, :error_class, :error_message, :backtrace) do
    # @return [Boolean] whether the expectation is met: a success, a warning
    #   or an info
    def passed?
      %i[success warning info].include?(outcome)
    end

    # @return [String] what happened: `expected ACTUAL to DESCRIPTION`, with
    #   `not` when negated and without the actual value when the block was
    #   not called, or `CLASS: MESSAGE` for an exception
    def summary
      return "#{error_class}: #{error_message}" if error_class

      ["expected", actual, ("not" if negate), "to", description].compact.join(" ")
    end

    # @return [String] the outcome as a title, then the summary:
    #   `Success: expected 42 to eq 42`
    def to_s
      "#{outcome.to_s.capitalize}: #{summary}"
    end
  end
end
