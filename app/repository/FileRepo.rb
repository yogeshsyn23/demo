class FileRepo
  attr_reader :user_id,:file_params

  def initialize(file_params,user_id)
    @file_params=file_params
    @user_id=user_id
  end

  def insert
    @original_filename=@file_params.original_filename
    @file=Fileinfo.create(name: @original_filename,user_id: @user_id)
  end

  def file_id
    @file.id
  end
end