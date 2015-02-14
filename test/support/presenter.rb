def subject(title, &block)
  @object = block.call
  puts "Testing: #{title}"
end

def it(describe, &expectation)
  print " * #{describe}: ".ljust 79
  expectation.call.equal?(true) ? puts('.') : abort('F')
end
