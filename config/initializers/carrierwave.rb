CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     => 'AKIAISGDFFMT3SD3BKXA',
    :aws_secret_access_key => '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',
    :region                => 'eu-west-1',
    :host                  => 'spicerack-preview.s3-eu-west-1.com'
  }

  # For testing, upload files to local `tmp` folder.
  config.storage = :fog

  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku

  config.fog_directory = 'spicerack-preview'
  # config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)

end