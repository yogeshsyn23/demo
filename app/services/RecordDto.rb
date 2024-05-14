class RecordDto
  attr_accessor :date,:value,:domain,:user_id,:fileinfo_id

  def initialize(row,user_id,fileinfo_id)
    @date=row['date']
    @value=row['value']
    @domain=row['domain']
    @user_id=user_id
    @fileinfo_id=fileinfo_id
  end
end