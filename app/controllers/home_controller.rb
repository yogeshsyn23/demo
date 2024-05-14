class HomeController < ApplicationController

  def index
  end
  def download
    send_file(
      "#{Rails.root}/public/sample.csv",
      filename: "sample.csv",
      type: "text/csv",
    )
    # DownloadSample.new.send
  end
  def import
    return redirect_to home_path,notice: "No file added" if params[:file].nil?
    return redirect_to home_path, notice: "only csv file allowed" unless params[:file].content_type=="text/csv"

    file_repo=FileRepo.new(params[:file],current_user.id)
    file_repo.insert

    import_service=ImportService.new
    import_service.call( params[:file], current_user.id,file_repo.file_id)

    path=File.join Rails.root,'public'
    content_type=params[:file].content_type
    original_filename=params[:file].original_filename
    file_path=File.join(path,original_filename)
    # file_path="/opt/code/localstack/localstack/depreciations.py"
    bucket_name="demo"
    object_key="setup"
    # binding.b
    # upload=Upload.new
    # upload.create_bucket(bucket_name)
    # upload.list_buckets
    # upload.put_object(file_path,bucket_name,object_key,content_type)
    # upload.list_objects(bucket_name)

    import_service.upload_file_to_s3(params[:file],bucket_name,file_path,content_type)
    return redirect_to home_path ,notice: "import started "
  end
end
