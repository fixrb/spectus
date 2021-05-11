# frozen_string_literal: true

desc "Generate the picture of the behavior of the code"
task :brutal do
  sh("bundle exec brutal")
  sh("chmod +x test.rb")
end
