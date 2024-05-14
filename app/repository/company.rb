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

class CompanyListResponse
  const :data, T::Array[Company]
end