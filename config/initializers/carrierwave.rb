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
end

# This will help increase the speed when testing by disable the ability to creating version of a uploaded file.

if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end
