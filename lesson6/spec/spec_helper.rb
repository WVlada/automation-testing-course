require_relative '../pages'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

config.disable_monkey_patching!
#config.order = :random #just temperarely
config.warnings = true
Kernel.srand config.seed

end
