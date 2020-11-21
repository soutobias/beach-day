class TrafficsController < ApplicationController
before_action :set_beach, only: [:index]

  def index
    skip_authorization
  end

  private

  def set_beach
    @beach = Beach.find(params[:beach_id])
    # authorize @beach
  end
end
