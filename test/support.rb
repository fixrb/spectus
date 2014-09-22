Dir[File.join File.dirname(__FILE__), 'support', '**' '*.rb'].each do |filename|
  require_relative filename
end
