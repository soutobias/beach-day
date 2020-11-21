class BeachesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_beach, only: [:show]

  def index
    @beaches = policy_scope(Beach).order(created_at: :desc)
    # @beaches = Beach.all
  end

  def show
    @markers = {
      lat: @beach.lat,
      lng: @beach.lng
    }
  end

  private

  def set_beach
    @beach = Beach.find(params[:id])
    authorize @beach
  end
end
