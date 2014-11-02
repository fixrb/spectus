def subject(title = nil, &block)
  if block
    @subject = block.call
    puts "Testing: #{title}"
  else
    @subject
  end
end

def it(describe, &expectation)
  print " * #{describe}: ".ljust 79
  expectation.call.equal?(true) ? puts('.') : abort('F')
end
