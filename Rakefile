# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"
require "rubocop/rake_task"
require "yard"

Rake::TestTask.new do |t|
  t.pattern = "test.rb"
  t.verbose = true
  t.warning = true
end

RuboCop::RakeTask.new
YARD::Rake::YardocTask.new

Dir["tasks/**/*.rake"].each { |t| load t }

tasks = %i[
  yard
  brutal
  rubocop:autocorrect
]

tasks << :test if RUBY_VERSION.start_with?("3.2.")
task default: tasks
