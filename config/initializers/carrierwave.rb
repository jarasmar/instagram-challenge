CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                                          # required
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                       # required unless using use_iam_profile
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region:                'eu-west-2',                                   # required unless using use_iam_profile
  }
  config.storage = :fog
  config.permissions = 0666
  config.cache_dir = "#{Rails.root}/tmp/"
  config.fog_directory  = ENV['FOG_DIRECTORY']                              # required
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }  # optional, defaults to {}
end
