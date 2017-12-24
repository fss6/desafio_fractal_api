# spec/support/factory_bot.rb
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  FactoryBot.allow_class_lookup = false
end