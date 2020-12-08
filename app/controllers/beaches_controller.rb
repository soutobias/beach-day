class BeachesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_beach, only: [:show]

  def index
    @beaches = policy_scope(Beach)
    if params[:query].present?
      @beaches = @beaches.where("name ILIKE ?", "%#{params[:query]}%")
    end
    if params[:options].present?
      if params[:options] == "Melhor praia"
        @beaches = @beaches.order(overall_rating: :desc)
      elsif params[:options] == "Melhor praia para surfe"
        @beaches = @beaches.order(overall_wave: :desc)
      elsif params[:options] == "Praia mais segura"
        @beaches = @beaches.order(overall_security: :desc)
      elsif params[:options] == "Praia mais limpa"
        @beaches = @beaches.order(overall_cleaning: :desc)
      elsif params[:options] == "Praia mais acessível"
        @beaches = @beaches.order(overall_accessibility: :desc)
      end
    end
  end

  def show
    @reviews = policy_scope(Review).where("beach_id = #{@beach.id}").order(created_at: :desc)

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

    @oceans = OceanForecastValue.where("beach_id = #{@beach.id}").order(date_time: :asc)

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

    @dailies = WeatherForecastDaily.where("beach_id = #{@beach.id}").order(date_time: :asc)

    @portuguese = []
    @dailies.each do |day|
      @portuguese << week_day_portuguese(day.date_time.strftime("%A").downcase)
    end

  end

  private

  def set_beach
    @beach = Beach.find(params[:id])
    authorize @beach
  end

  def week_day_portuguese(english)
    case english
    when "sunday"
      return "Domingo"
    when "monday"
      "Segunda-feira"
    when "tuesday"
      return "Terça-feira"
    when "wednesday"
      return "Quarta-feira"
    when "thrusday"
      return "Quinta-feira"
    when "friday"
      return "Sexta-feira"
    when "saturday"
      return "Sábado"
    end
  end
end
