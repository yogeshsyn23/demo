class RecordRepo
  def initialize(user_id=nil )
    @user_id=user_id unless user_id==nil
  end

  def insert(record_dto)
    @record=Record.create(date: record_dto.date,
                          value: record_dto.value,
                          domain: record_dto.domain,
                          user_id: record_dto.user_id,
                          fileinfo_id: record_dto.fileinfo_id)
  end
  def get_empty_status
    Record.where(user_id: @user_id).first.nil?
  end
  def get_max
    Record.where(user_id: @user_id).select(:domain).group(:domain).maximum(:value)
  end

  def get_median
    # array=[]
    # sum=0
    # Record.where(user_id: @user_id).each do |record|
    #   if record.domain=="redis"
    #   array.append(record.value)
    #   end
    # end
    # sorted_array=array.sort
    # len=array.length
    # median=(sorted_array[(len-1)/2]+sorted_array[(len/2)])/2.0
    median= Record.where(user_id: @user_id).select(:domain).group(:domain).median(:value)
    median
  end

  def get_count
    @group_record=Record.where(user_id: @user_id).select(:domain).group(:domain).count
  end
  def get_domain_hash
    # domain_hash=Hash.new{ |h,k| h[k]=Hash.new}
    # Record.where(user_id: @user_id).each do |record|
    #   domain_hash[record.domain][record.date]=record.value
    # end
    domain_hash=[]
    Record.where(user_id: @user_id).group(:domain).each do |record|
      temp={
        name: record.domain,
        data: Record.where(user_id: @user_id,domain: record.domain).map{
          |t|[t.date, t.value]
        }
      }
      domain_hash.append(temp)
    end
    return domain_hash

  end


end