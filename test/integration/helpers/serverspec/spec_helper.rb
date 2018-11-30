require 'serverspec'

if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM).nil?
  set :backend, :exec
else
  set :backend, :cmd
  set :os, family: 'windows'
end

# Load shared tests
base_spec_dir = Pathname.new(File.join(File.dirname(__FILE__)))
Dir[base_spec_dir.join('shared_tests/**/*.rb')].sort.each { |f| require f }
