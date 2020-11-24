class RealTimesController < ApplicationController
  def index
    @beach = Beach.find(params[:beach_id])
    @real_times = policy_scope(RealTimeValue).where("beach_id = #{@beach.id}").order(date_time: :asc)
  end
end
