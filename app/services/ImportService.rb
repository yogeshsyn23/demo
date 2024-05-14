class ImportService
  require 'csv'
  require 'aws-sdk-core'
  require 'aws-sdk-s3'
  def call(file,user_id,file_id)
    @file=File.open(file)
    csv=CSV.parse(@file,headers: true,col_sep: ",")
    csv.each do |row|
      record_dto=RecordDto.new(row,user_id,file_id)
      RecordRepo.new.insert(record_dto)
    end
    # upload
  end
  def upload_file_to_s3(file_path, bucket_name, object_key,content_type)
    aws_region = 'us-east-1'
    endpoint_url = "http://localhost.localstack.cloud:4566"
    credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    s3 = Aws::S3::Resource.new(region: aws_region, endpoint: endpoint_url, credentials: credentials)
    buckets = s3.buckets
    buckets.each do |bucket|
      puts "Bucket name: #{bucket.name}"
      puts "Bucket creation date: #{bucket.creation_date}"
      puts "--------------------"
    end
    obj = s3.bucket(bucket_name).object(object_key)
    # File.open(file_path, 'rb') do |file|
    puts bucket_name
      @output=obj.put(body: file_path, content_type: content_type)
    # end
    # obj.upload_file(file_path,content_type: content_type)
    binding.b
    # upload
  end
  def upload

    aws_region = 'us-east-1'
    endpoint_url = "http://localhost.localstack.cloud:4566"
    credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    client = Aws::S3::Client.new(region: aws_region, endpoint: endpoint_url, credentials: credentials)
    binding.b
    client.put_object({bucket: "demo",
                       key: "book",
                       body: @file})

  end

end