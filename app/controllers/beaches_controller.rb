class BeachesController < ApplicationController

  def index
    @beaches = policy_scope(Beach).order(created_at: :desc)
    # @beaches = Beach.all
  end

end
