class AnalysisController < ApplicationController

  def index
    @user=user.find(current_user.id)
  end

  def show
    @user_id=current_user.id
    record_repo=RecordRepo.new(@user_id)
    @is_empty=record_repo.get_empty_status
    @max_value=record_repo.get_max
    @median_value=record_repo.get_median
    @count_value=record_repo.get_count
    @domain_hash=record_repo.get_domain_hash
  end
end
