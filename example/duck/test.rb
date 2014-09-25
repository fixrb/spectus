#!/usr/bin/env ruby -w

require_relative 'app'

# require 'spectus'
require_relative '../../lib/spectus'

extend Spectus::DSL

expectation_1 = expect { @app.swims  }.to capture_stderr: " ...\n"
expectation_2 = expect { @app.quacks }.to capture_stdout: "Quaaaaaack!\n"
expectation_3 = expect { @app.speaks }.to raise_exception: NoMethodError
expectation_4 = expect { @app.walks  }.to eql: "Quaaa... Klop klop!"

case (expectation_1.pass? &&
      expectation_2.pass? &&
      expectation_3.pass? &&
      expectation_4.pass?)
  when true then puts "I call that #{@app} a duck."
  else warn 'WAT?'
end
