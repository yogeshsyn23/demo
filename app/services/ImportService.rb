class ImportService
  require 'csv'
  def call(file)
    file=File.open(file)
    csv=CSV.parse(file,headers: true,col_sep: ",")
    csv.each do |row|
      record_hash=Hash.new
      record_hash[:date]=row['date']
      record_hash[:domain]=row['domain']
      record_hash[:value]=row['value']
      return record_hash
    end
  end
end