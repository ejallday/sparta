ENV["RAILS_ENV"] ||= 'test'

$LOAD_PATH.unshift(File.dirname(File.dirname(__FILE__)))

RSpec.configure do |config|
  config.order = "random"
end
