# if !Rails.env.development?

#   AssetSync.configure do |config|
 
#    config.gzip_compression = true
 
#    config.manifest = true
 
#    config.existing_remote_files = 'keep'
 
#    config.fog_provider = 'AWS'
 
#    config.aws_access_key_id = ENV.fetch('S3_ACCESS_KEY_ID')
 
#    config.aws_secret_access_key = ENV.fetch('S3_SECRET_ACCESS_KEY')
 
#    config.fog_directory = ENV.fetch('S3_BUCKET')
 
#    config.fog_region = ENV.fetch('S3_REGION') #"eu-west-1"
 
 
#    config.fog_path_style = true
 
#    config.run_on_precompile = false # https://github.com/AssetSync/asset_sync#rake-task
 
#   end
 
#  end
