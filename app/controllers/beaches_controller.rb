class BeachesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @beaches = policy_scope(Beach).order(created_at: :desc)
    # @beaches = Beach.all
  end

  def traffic
  end
end
