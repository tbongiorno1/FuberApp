require "refile/s3"

if Rails.env.production?
  Refile.cdn_host = ENV['AWS_HOST_URL']

  aws = {
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY_ID'],
    region: ENV['AWS_REGION'],
    bucket: ENV['S3_BUCKET_NAME'],
  }

  Refile.cache = Refile::S3.new(max_size: 10.megabytes, prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
end
