Raven.configure do |config|
  config.environments = %w[ staging production ]
  config.dsn = ENV['SENTRY_DSN']
end
