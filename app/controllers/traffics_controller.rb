class TrafficsController < ApplicationController
  def index
    @beaches = policy_scope(Beach)
    @makers = @beaches.geocoded.map do |beach|
      {
        lat: beach.lat,
        lng: beach.lng
      }
    end
  end
end
