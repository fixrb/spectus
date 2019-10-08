# frozen_string_literal: true

require 'matchi'

module Spectus
  # The module includes the list of matcher methods.
  #
  # @api public
  #
  module Matchers
    ::Matchi::Matchers.constants.each do |const|
      name = const.to_s
                  .gsub(/::/, '/')
                  .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
                  .gsub(/([a-z\d])([A-Z])/, '\1_\2')
                  .downcase

      # Define a method for the given matcher.
      #
      # @example Given the `Matchi::Matchers::Equal::Matcher` matcher, its
      #   method would be:
      #
      #   def equal(expected)
      #     Matchi::Matchers::Equal::Matcher.new(expected)
      #   end
      #
      # @return [#matches?] The matcher.
      define_method name do |*args|
        ::Matchi::Matchers.const_get(const)::Matcher.new(*args)
      end
    end
  end
end
