CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_ACCESS_KEY_ID'],
      region: ENV['AWS_REGION']
    }
    config.fog_public = false
    config.fog_directory = ENV['AWS_STORE_BUCKET']
    config.storage = :fog
  else
    config.storage = :file
  end

  config.enable_processing = false if Rails.env.test?
end
