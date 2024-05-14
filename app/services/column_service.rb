# frozen_string_literal: true

class ColumnService
  extend T::Sig

  sig { params(dto: CompanyListResponse).void }
  def modify(dto:)
    mdto = dto.data.map do |company|
      company.id = company.id + 1
      company
    end
    dto.data = mdto
    dto
  end

  sig { params(dto: CompanyListResponse).void }
  def modify_v2(dto:)
    mdto = dto.data.map do |company|
      company.id = company.id + 1
      company
    end
    dto.data = mdto
  end

  sig { params(dto: CompanyListResponse).void }
  def modify_new(dto:)
    upload_aws
    mdto = dto.data.map do |company|
      company.id = company.id + 1
      company
    end
    mdto = dto.data.map do |company|
      company.id = company.id + 13
      company
    end
    mdto = mdto.map do |company|
      company.uid = "#{company.uid}s"
      company
    end
    dto.data = mdto
  end

  sig { void }
  def upload_aws
    aws_region = 'us-east-1'
    endpoint_url = 'http://localhost.localstack.cloud:4566'
    credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    client = Aws::S3::Client.new(region: aws_region, endpoint: endpoint_url, credentials: credentials)
    client.put_object({ bucket: 'demo',
                        key: 'book',
                        body: @file })
  end
end
