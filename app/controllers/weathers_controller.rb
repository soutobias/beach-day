class WeathersController < ApplicationController
  def index
    @beach = Beach.find(params[:beach_id])
    @weathers = policy_scope(WeatherForecastValue).where("beach_id = #{@beach.id}").order(date_time: :asc)
    query = "date_time <=  '#{DateTime.now.strftime('%Y-%m-%d 23:59:59')}'"
    @weathers_today = @weathers.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 1).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 1).strftime('%Y-%m-%d 00:00:00')}'"
    @weathers_today_1 = @weathers.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 2).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 2).strftime('%Y-%m-%d 00:00:00')}'"
    @weathers_today_2 = @weathers.where(query).order(date_time: :asc)

    @oceans = policy_scope(OceanForecastValue).where("beach_id = #{@beach.id}").order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.strftime('%Y-%m-%d 23:59:59')}'"
    @oceans_today = @oceans.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 1).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 1).strftime('%Y-%m-%d 00:00:00')}'"
    @oceans_today_1 = @oceans.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 2).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 2).strftime('%Y-%m-%d 00:00:00')}'"
    @oceans_today_2 = @oceans.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 3).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 3).strftime('%Y-%m-%d 00:00:00')}'"
    @oceans_today_3 = @oceans.where(query).order(date_time: :asc)

    query = "date_time <=  '#{DateTime.now.advance(days: 4).strftime('%Y-%m-%d 23:59:59')}' AND date_time >=  '#{DateTime.now.advance(days: 4).strftime('%Y-%m-%d 00:00:00')}'"
    @oceans_today_4 = @oceans.where(query).order(date_time: :asc)

    @dailies = policy_scope(WeatherForecastDaily).where("beach_id = #{@beach.id}").order(date_time: :asc)
  end
end
