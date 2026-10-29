# frozen_string_literal: true

# A matcher made of a block: `match?` runs the block with the one given, and
# `to_s` is the description.
def matcher(description = "match", &)
  object = Object.new
  object.define_singleton_method(:match?, &)
  object.define_singleton_method(:to_s) { description }
  object
end

# A matcher whose match? answers what the block returns, once called.
def answering(answer)
  matcher { |&block| block.call; answer } # rubocop:disable Style/Semicolon
end

# The exception a block raises, or nil.
def raised
  yield
  nil
rescue Exception => e # rubocop:disable Lint/RescueException
  e
end
