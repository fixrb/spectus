# frozen_string_literal: true

desc "Generate the picture of the behavior of the code"
task :brutal do
  `bundle exec brutal`
  `chmod +x test.rb`
end
