# frozen_string_literal: true

require "defi"

require_relative "result"
require_relative "text"

module Spectus
  # The levels of RFC 2119, each with the outcome of a failed match. The
  # keys are compared by identity: a level is one of these three symbols,
  # not an object that hashes like one.
  LEVELS = { MUST: :failure, SHOULD: :warning, MAY: :failure }.compare_by_identity.freeze

  # The outcome of a missing method, level by level.
  MISSING = { MUST: :error, SHOULD: :error, MAY: :info }.freeze

  private_constant :LEVELS
  private_constant :MISSING

  # An expectation: a level, a negation and a matcher, frozen. The matcher
  # is test code, trusted: it is kept as it is, its `match?` is called with
  # the block, and its `to_s` describes it.
  #
  # @!attribute [r] level
  #   @return [Symbol] `:MUST`, `:SHOULD` or `:MAY`
  # @!attribute [r] negate
  #   @return [Boolean] whether the match is expected to fail
  # @!attribute [r] matcher
  #   @return [#match?] the matcher
  Requirement = ::Data.define(:level, :negate, :matcher) do
    # @param level [Symbol] `:MUST`, `:SHOULD` or `:MAY`
    # @param negate [Boolean] whether the match is expected to fail; a MAY
    #   has no negative form
    # @param matcher [#match?] the matcher
    # @raise [ArgumentError] for any other level or negation, or a matcher
    #   that does not respond to `match?` (its own `respond_to?` is not asked)
    def initialize(level:, negate:, matcher:)
      raise ::ArgumentError, "the level must be :MUST, :SHOULD or :MAY" unless LEVELS.key?(level)
      raise ::ArgumentError, "negate must be true or false" unless true.equal?(negate) || false.equal?(negate)
      raise ::ArgumentError, "a MAY has no negative form" if negate && level.equal?(:MAY)
      unless ::Kernel.instance_method(:respond_to?).bind_call(matcher, :match?)
        raise ::ArgumentError, "the matcher must respond to match?"
      end

      super
    end

    # Runs the matcher with the block, and says how it went. Raises nothing
    # of its own: the exceptions a method raises on its own (those Defi
    # keeps, a `StandardError`, a `ScriptError`, a `SystemStackError` or a
    # `SystemExit`) end in the result, while an `Interrupt`, a signal, a
    # `NoMemoryError` and the end of a `Timeout` go through.
    #
    # @yieldreturn [Object] the actual value
    # @return [Spectus::Result]
    # @raise [ArgumentError] without a block
    # @raise [TypeError] when the `to_s` of the matcher is not a String
    def call(&block)
      raise ::ArgumentError, "a block must be given" unless block

      description = matcher.to_s
      raise ::TypeError, "the to_s of the matcher must be a String" unless ::String === description

      description = Text.utf8(description)
      produced = nil
      answer = ::Defi::Challenge.new(:match?) do
        produced = ::Defi::Challenge.new(:call).to(block)
        produced.call
      end.to(matcher)
      result(description, produced, answer)
    end

    private

    # The result, from what the block produced (nil when the matcher did not
    # call it) and what `match?` answered or raised.
    def result(description, produced, answer)
      actual = produced && Text.object(produced.object)
      error_class, error_message, backtrace = error(answer)
      Result.new(level:, negate:, outcome: outcome(produced, answer), description:, actual:, error_class:,
                 error_message:, backtrace:)
    end

    # The outcome: a method missing on the value the block produced is read
    # by the level; an answer of true or false is read with the negation, an
    # answer equal to the negation being a failed match; anything else is an
    # error.
    def outcome(produced, answer)
      return MISSING.fetch(level) if missing_method?(produced, answer)
      return :error unless verdict?(answer)

      negate.equal?(answer.object) ? LEVELS.fetch(level) : :success
    end

    # Whether `match?` answered true or false, which no exception is.
    def verdict?(answer)
      true.equal?(answer.object) || false.equal?(answer.object)
    end

    # Whether `match?` raised a NoMethodError whose receiver is the value the
    # block produced, compared by identity as BasicObject does. A
    # NoMethodError built by hand may have no receiver.
    def missing_method?(produced, answer)
      return false unless produced && !produced.raised? && answer.raised? && ::NoMethodError === answer.object

      receiver = ::NameError.instance_method(:receiver).bind_call(answer.object)
      ::BasicObject.instance_method(:equal?).bind_call(receiver, produced.object)
    rescue ::ArgumentError
      false
    end

    # The texts of the exception, when there is one: the one `match?` raised,
    # or a TypeError for an answer that is not true or false.
    def error(answer)
      return Text.exception(answer.object) if answer.raised?
      return [nil, nil, nil] if verdict?(answer)

      ["TypeError", "match? answered #{Text.object(answer.object)}, not true or false".freeze, nil]
    end
  end
end
