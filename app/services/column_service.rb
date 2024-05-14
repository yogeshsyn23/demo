class ColumnService

  def modify(dto)
    mdto = dto.data.map { |company| company.id = company.id + 1 ; company }
    dto.data = mdto
  end

  def modify(dto)
    upload_aws
    mdto = dto.data.map { |company| company.id = company.id + 1 ; company }
    mdto = dto.data.map { |company| company.id = company.id + 13 ; company }
    mdto = mdto.map { |company| company.uid = company.uid + 's' ; company }
    dto.data = mdto
  end

  def upload_aws

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
