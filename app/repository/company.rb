# typed: strict

class Company < T::Struct
  const :id, Integer
  const :name, String
  const :description, T.nilable(String)
  const :uid, String
  const :domain, T.nilable(String)
  const :logo_url, T.nilable(String)
  const :synaptic_company_id, T.nilable(Integer)
  const :is_favourite, T.nilable(T::Boolean)
  const :founding_date, T.nilable(Date)
  const :year_start, T.nilable(Integer)
end

class CompanyListResponse < T::Struct
  extend T::Sig

  const :data, T::Array[Company]

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