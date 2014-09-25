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
    warn "\e[31mF\e[0m"
  else
    fail result
  end
end
