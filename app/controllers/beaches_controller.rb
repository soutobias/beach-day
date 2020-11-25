class BeachesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_beach, only: [:show]

  def index
    @beaches = policy_scope(Beach).order(created_at: :desc)
    if params[:query].present?
      @beaches = Beach.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @beaches = Beach.all
    end
  end

  def show
    @markers = {
      lat: @beach.lat,
      lng: @beach.lng
    }
    @weathers = WeatherForecastValue.where("beach_id = #{@beach.id}").order(date_time: :asc)
    query = "date_time <=  '#{DateTime.now.strftime('%Y-%m-%d 23:59:59')}'"
    @weathers_today = @weathers.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 1).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 1).strftime('%Y-%m-%d 00:00:00')}'"
    @weathers_today_1 = @weathers.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 2).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 2).strftime('%Y-%m-%d 00:00:00')}'"
    @weathers_today_2 = @weathers.where(query).order(date_time: :asc)

    @waters = WaterForecastValue.where("beach_id = #{@beach.id}").order(date_time: :asc)

    @waves = WaveForecastValue.where("beach_id = #{@beach.id}").order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.strftime('%Y-%m-%d 23:59:59')}'"
    @waves_today = @waves.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 1).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 1).strftime('%Y-%m-%d 00:00:00')}'"
    @waves_today_1 = @waves.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 2).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 2).strftime('%Y-%m-%d 00:00:00')}'"
    @waves_today_2 = @waves.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 3).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 3).strftime('%Y-%m-%d 00:00:00')}'"
    @waves_today_3 = @waves.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 4).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 4).strftime('%Y-%m-%d 00:00:00')}'"
    @waves_today_4 = @waves.where(query).order(date_time: :asc)


    query = "date_time <=  '#{DateTime.now.strftime('%Y-%m-%d 23:59:59')}'"
    @waters_today = @waters.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 1).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 1).strftime('%Y-%m-%d 00:00:00')}'"
    @waters_today_1 = @waters.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 2).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 2).strftime('%Y-%m-%d 00:00:00')}'"
    @waters_today_2 = @waters.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 3).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 3).strftime('%Y-%m-%d 00:00:00')}'"
    @waters_today_3 = @waters.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 4).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 4).strftime('%Y-%m-%d 00:00:00')}'"
    @waters_today_4 = @waters.where(query).order(date_time: :asc)

    @dailies = WeatherForecastDaily.where("beach_id = #{@beach.id}").order(date_time: :asc)
  end

  private

  def set_beach
    @beach = Beach.find(params[:id])
    authorize @beach
  end
end
