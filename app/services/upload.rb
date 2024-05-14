require 'aws-sdk-s3'
require 'aws-sdk-core'
class Upload
  def create_bucket(bucket_name)
    aws_region = 'us-east-1'
    endpoint_url = "http://localhost.localstack.cloud:4566" # Replace with your localstack endpoint
    credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    @s3 = Aws::S3::Resource.new(
      region: aws_region,
      endpoint: endpoint_url,
      credentials: credentials
    )
    @client=@s3.client
    binding.b
    bucket = @s3.bucket(bucket_name)
    unless bucket.exists?
      bucket.create
      sleep 1 until bucket.exists?
    end
    # output=bucket.create unless bucket.exists?
    binding.b
  end
  def list_buckets
    aws_region = 'us-east-1'
    endpoint_url = "http://localhost.localstack.cloud:4566" # Replace with your localstack endpoint
    credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])

    @s3 = Aws::S3::Resource.new(
      region: aws_region,
      endpoint: endpoint_url,
      credentials: credentials
    )
    @client=@s3.client
    buckets = @s3.buckets
    buckets.each do |bucket|
      puts "Bucket name: #{bucket.name}"
      puts "Bucket creation date: #{bucket.creation_date}"
      puts "--------------------"
    end
  end

  def put_object(file_path, bucket_name, object_key, content_type)
    aws_region = 'us-east-1'
    endpoint_url = "http://localhost.localstack.cloud:4566" # Replace with your localstack endpoint
    credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])

    @s3 = Aws::S3::Resource.new(
      region: aws_region,
      endpoint: endpoint_url,
      credentials: credentials
    )
    @client=@s3.client
      bucket = @s3.bucket(bucket_name)

    # binding.b
    obj = bucket.object(object_key)
    File.open(file_path, 'rb') do |file|
      obj.put(body: file)
    end
  end
  def list_objects(bucket_name)
    aws_region = 'us-east-1'
    endpoint_url = "http://localhost.localstack.cloud:4566" # Replace with your localstack endpoint
    credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])

    @s3 = Aws::S3::Resource.new(
      region: aws_region,
      endpoint: endpoint_url,
      credentials: credentials
    )
    @client=@s3.client
    bucket = @s3.bucket(bucket_name)
    objects = bucket.objects
    binding.b
    objects.each do |object|
      binding.b
      puts "Object key: #{object.key}"
      puts "Object name: #{object.name}"
      puts "Object last modified: #{object.last_modified}"
      puts "Object size: #{object.size}"
      puts "--------------------"
    end
  end
end