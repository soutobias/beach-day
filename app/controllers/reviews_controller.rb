class ReviewsController < ApplicationController
  def index
    @beach = Beach.find(params[:beach_id])
    @reviews = policy_scope(Review).where("beach_id = #{@beach.id}").order(created_at: :desc)
  end

  def new
    @beach = Beach.find(params[:beach_id])
    @review = Review.new
    authorize @review
  end

  def create
    @beach = Beach.find(params[:beach_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.beach = @beach
    if @review.save
      redirect_to beach_path(@beach)
    else
      @review = Review.new
      render "new"
    end
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :parking, :restaurant, :public_transportation, :security, :cleaning, :rent_equipment, :wave, :wind, :accessibility, :sand_strip)
  end
end
