# Or you can configure the client in the code (not recommended - keep your DSN secret!)
Raven.configure do |config|
  config.environments = ['staging', 'production', 'demo', 'techsauce']
  config.current_environment = ENV['CURRENT_ENVIRONMENT']
  config.dsn = ENV['SENTRY_DSN']
end
