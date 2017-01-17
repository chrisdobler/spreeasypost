# spec/support/factory_girl.rb
RSpec.configure do |config|
  # ... other FactoryGirl configs

    # Ensure Suite is set to use transactions for speed.
  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  # Before each spec check if it is a Javascript test and switch between using database transactions or not where necessary.
  config.before :each do
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
    FactoryGirl.lint
  end

  # After each spec clean the database.
  config.after :each do
    DatabaseCleaner.clean
  end
end