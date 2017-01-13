require 'rails/all'

require 'factory_girl'
require 'factory_girl_rails'
require 'rspec/rails'

require 'support/rails_app/config/environment'

ActiveRecord::Migration.maintain_test_schema!

# set up db
# be sure to update the schema if required by doing
# - cd spec/support/rails_app
# - rake db:migrate
ActiveRecord::Schema.verbose = false
load 'support/rails_app/db/schema.rb' # db agnostic

require 'support/rails_app/factory_girl'
require 'spec_helper'