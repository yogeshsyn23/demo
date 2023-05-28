class HomeController < ApplicationController
  def index
  end
  def download
    send_file(
      "#{Rails.root}/public/sample.csv",
      filename: "sample.csv",
      type: "text/csv"
    )
  end
  def import
    # binding.b
    return redirect_to home_path,notice: "No file added" if params[:file].nil?
    return redirect_to home_path, notice: "only csv file allowed" unless params[:file].content_type=="text/csv"
    # record_hash=ImportService.new.call(params[:file])
    # @user=User.find(current_user.id)
    # @user.record.create(record_hash)
    return redirect_to home_path ,notice: "import started "
  end
end
