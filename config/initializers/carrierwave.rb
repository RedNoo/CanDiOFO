require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.permissions = 0666
  config.directory_permissions = 0777
  config.storage = :file
  config.enable_processing = false
 config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
 config.cache_dir = Rails.root.join('tmp', 'uploads')
end
