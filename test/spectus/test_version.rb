require_relative 'helper_test'

subject "version" do
  Spectus::VERSION
end

it 'must return the version' do
  expect { subject }.to equal: File.open(
    Pathname.new(__FILE__).join '..', '..', '..', 'VERSION.semver'
  ).read.chomp.to_sym
end
