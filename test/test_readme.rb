# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "spectus")

# The README requires the gem by its name.
$LOAD_PATH.unshift(File.expand_path(File.join("..", "lib"), __dir__))

# Each Ruby example of the README runs, and each `# => value` comment is
# what the expression before it gives, written by inspect. The Gemfile
# excerpt is left out.
readme = File.read(File.join(__dir__, "..", "README.md"), encoding: Encoding::UTF_8)
examples = readme.scan(/^```ruby\n(.*?)^```\n/m).flatten.reject { |code| code.include?("# Gemfile") }
raise if examples.empty?
examples.each do |code|
  binding = TOPLEVEL_BINDING.dup
  code.each_line(chomp: true) do |line|
    expression, expected = line.split(" # => ", 2)
    next binding.eval(line) unless expected

    actual = binding.eval(expression).inspect
    raise "#{expression.strip}\n  gave #{actual}\n  not  #{expected}" unless actual == expected
  end
end
