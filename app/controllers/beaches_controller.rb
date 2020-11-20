class BeachesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @beaches = policy_scope(Beach).order(created_at: :desc)
    if params[:query].present?
      @beaches = Beach.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @beaches = Beach.all
    end
  end

  private

  def beach_params
    params.require(:beach).permit(:name, :lat, :lng, :overall_reviews, :overview, :photo)
  end
end
