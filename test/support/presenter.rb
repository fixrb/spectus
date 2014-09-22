def subject title = nil, &block
  if block
    @subject = block.call
    puts "Testing: #{title}"
  else
    @subject
  end
end

def it describe, &expectation
  print " * #{describe}: ".ljust 79

  result = expectation.call

  case result.state
  when :success
    puts "\e[32m#{result}\e[0m"
  when :failure
    warn "\e[31m#{result}\e[0m"
  else
    fail result.exception
  end
end
