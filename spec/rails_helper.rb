require 'simplecov'
SimpleCov.start do
  add_filter 'app/models/application_record.rb'
  add_filter 'app/controllers/application_controller.rb'
  add_filter 'app/jobs/application_job.rb'
  add_filter 'app/mailers/application_mailer.rb'
  add_filter 'app/services/application_service.rb'
  add_filter 'app/forms/application_form.rb'
  add_filter 'app/queries/application_query.rb'
  add_filter 'app/calculations/application_calculation.rb'
  add_filter 'app/policies/application_policy.rb'
  add_filter 'app/decorators/application_decorator.rb'
  add_filter 'app/decorators/paginating_decorator.rb'
  add_filter 'config/'
  add_filter 'spec/'

  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Jobs', 'app/jobs'
  add_group 'Mailers', 'app/mailers'
  add_group 'Services', 'app/services'
  add_group 'Forms', 'app/forms'
  add_group 'Queries', 'app/queries'
  add_group 'Calculations', 'app/calculations'
  add_group 'Policies', 'app/policies'
  add_group 'Decorators', 'app/decorators'
end

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'faker'
require 'vcr'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
