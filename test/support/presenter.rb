@failures = 0

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

  case result
  when true
    puts "\e[32m.\e[0m"
  when false
    @failures += 1
    warn "\e[31mF\e[0m"
  else
    @failures += 1
    fail result
  end
end

at_exit do
  abort("\e[31mFailure.\e[0m") unless @failures.zero?
end
