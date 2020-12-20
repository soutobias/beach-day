namespace :web_scrapping do
  desc "Connect to buoy api and get data"
  task buoy: :environment do
    def direction_to_string(value)
      if value > 45 / 2 && value <= 45 + 45 / 2
        direction = "Nordeste"
      elsif value > 45 + 45 / 2 && value <= 90 + 45 / 2
        direction = "Leste"
      elsif value > 90 + 45 / 2 && value <= 180 - 45 / 2
        direction = "Sudeste"
      elsif value > 180 - 45 / 2 && value <= 180 + 45 / 2
        direction = "Sul"
      elsif value > 180 + 45 / 2 && value <= 270 - 45 / 2
        direction = "Sudoeste"
      elsif value > 270 - 45 / 2 && value <= 270 + 45 / 2
        direction = "Oeste"
      elsif value > 270 + 45 / 2 && value <= 360 - 45 / 2
        direction = "Noroeste"
      else
        direction = "Norte"
      end
    end

    def translate_description(description)
      description = description.downcase
      if description == "clear sky"
        description = "Céu Limpo"
      elsif description == "few clouds"
        description = "Poucas Nuvens"
      elsif description == "overcast clouds"
        description = "Poucas Nuvens"
      elsif description == "scattered clouds"
        description = "Nuvens Esparsas"
      elsif description == "broken clouds"
        description = "Nuvens Esparsas"
      elsif description == "shower rain"
        description = "Chuva Forte"
      elsif description == "rain"
        description = "Chuva"
      elsif description == "thunderstorm"
        description = "Trovões"
      elsif description == "thunderstorm with light rain"
        description = "Trovões com chuva"
      elsif description == "thunderstorm with rain"
        description = "Trovões com chuva"
      elsif description == "thunderstorm with heavy rain"
        description = "Trovões com chuva"
      elsif description == "light thunderstorm"
        description = "Trovões"
      elsif description == "heavy thunderstorm"
        description = "Trovões"
      elsif description == "ragged thunderstorm"
        description = "Trovões"
      elsif description == "light rain" || description == "light intensity shower rain"
        description = "Chuva Fraca"
      elsif description == "moderate rain" || description == "shower shower rain"
        description = "Chuva Moderada"
      elsif description == "heavy intensity rain" || description == "heavy intensity shower rain"
        description = "Chuva Forte"
      elsif description == "very heavy rain" || description == "ragged intensity shower rain"
        description = "Chuva Muito Forte"
      elsif description == "extreme rain"
        description = "Temporal"
      elsif description == "few clouds: 11-25%"
        description = "Poucas Nuvens"
      elsif description == "few clouds: 25-50%"
        description = "Nuvens Esparsas"
      elsif description == "few clouds: 51-84%"
        description = "Nuvens Esparsas"
      elsif description == "few clouds: 85-100%"
        description = "Céu Nublado"
      end
      return description
    end

    BuoyValue.destroy_all

    def buoy_data
      time_start = Time.now.to_i - 3600 * 3
      time_end = Time.now.to_i
      buoy_stations = BuoyStation.all
      buoy_stations.each do |buoy_station|
        p buoy_station
        meteo_values = RestClient.get "simcosta.furg.br/api/metereo_data?boiaID=3&type=json&time1=#{time_start}&time2=#{time_end}&params=Average_wind_direction_N,Last_sampling_interval_gust_speed,Average_Pressure,Average_Air_Temperature,Instantaneous_Humidity,Average_Humidity,Average_wind_speed"
        meteo_values = JSON.parse(meteo_values)
        meteo_values.each do |value|
          date_time = DateTime.new(value["YEAR"], value["MONTH"], value["DAY"], value["HOUR"], value["MINUTE"].to_i - 5, 0)
          buoy = BuoyValue.where("date_time = '#{date_time.strftime("%Y-%m-%d %H:%M:%S")}'")
          unless buoy.empty?
            buoy[0].update(
              date_time: date_time,
              pressure: value["Avg_Air_Press"],
              air_temperature: value["Avg_Air_Tmp"],
              humidity: value["Avg_Hmt"],
              wind_speed: value["Avg_Wnd_Sp"].to_f,
              wind_direction: direction_to_string(value["Avg_Wnd_Dir_N"].to_f)
            )
          else
            val = BuoyValue.new(
              date_time: date_time,
              pressure: value["Avg_Air_Press"],
              air_temperature: value["Avg_Air_Tmp"],
              humidity: value["Avg_Hmt"],
              wind_speed: value["Avg_Wnd_Sp"].to_f,
              wind_direction: direction_to_string(value["Avg_Wnd_Dir_N"].to_f)
            )
            val.buoy_station = buoy_station
            val.save!
          end
        end
        ocean_values = RestClient.get "http://simcosta.furg.br/api/oceanic_data?boiaID=3&type=json&time1=#{time_start}&time2=#{time_end}&params=Hsig_Significant_Wave_Height_m,Mean_Wave_Direction_deg,Hmax_Maximum_Wave_Height_m,TP_Peak_Period_seconds,Average_Temperature_deg_C"
        ocean_values = JSON.parse(ocean_values)
        ocean_values.each do |value|
          date_time = DateTime.new(value["YEAR"], value["MONTH"], value["DAY"], value["HOUR"], value["MINUTE"].to_i - 5, 0)
          buoy = BuoyValue.where("date_time = '#{date_time.strftime("%Y-%m-%d %H:%M:%S")}'")

          unless buoy.empty?
            buoy[0].update(
              wave_height: value["Hsig"],
              water_temperature: value["Avg_W_Tmp1"],
              wave_formation: value["TP"],
              wave_direction: value["Avg_Wv_Dir_N"]
            )
          else
            val = BuoyValue.new(
              date_time: date_time,
              wave_height: value["Hsig"],
              water_temperature: value["Avg_W_Tmp1"],
              wave_formation: value["TP"],
              wave_direction: direction_to_string(value["Avg_Wv_Dir_N"].to_f)
            )
            val.buoy_station = buoy_station
            val.save!
          end
        end
      end
    end
    buoy_data
  end

  task visual: :environment do
    def visual_data
      visual_stations = VisualStation.all
      visual_stations.each do |visual_station|
        html_file = open(visual_station.url).read
        html_doc = Nokogiri::HTML(html_file)
        value = html_doc.search("[class='h5 text-primary margin-xxs-bottom']")

        wave_height = value.text.strip.gsub(",", ".")[0...-1].to_f
        value = html_doc.search("[class='h5 no-margin text-primary']")
        wave_formation = value[0].text.strip.gsub(",", ".")[0...-1].to_f
        water_temperature = value[1].text[0...-2].to_f
        value = html_doc.search("[class='small line-height-xs']")
        wave_direction = value[0].text
        date_time = Time.now
        date_time = date_time.strftime("%Y-%m-%d 00:00:00")
        visual_value = VisualValue.where("date_time = '#{date_time}' AND visual_station_id = #{visual_station.id}")
        unless visual_value.empty?
          visual_value[0].update(
            date_time: date_time,
            wave_height: wave_height,
            wave_direction: wave_direction,
            wave_formation: wave_formation,
            water_temperature: water_temperature
          )
        else
          visual_value = VisualValue.new(
            date_time: date_time,
            wave_height: wave_height,
            wave_direction: wave_direction,
            wave_formation: wave_formation,
            water_temperature: water_temperature
          )
          visual_value.visual_station = visual_station
          visual_value.save!
          puts ("Success: Inserted #{visual_station.url}")
        end
      end
    end
    visual_data
  end

  task get_cleaning: :environment do
    def cleaning_status
      html_file = open("https://praialimpa.net/").read
      html_doc = Nokogiri::HTML(html_file)

      cities = html_doc.css("[class='main wrapper clearfix']").css('section')
      places = ["Niterói", "Paquetá", "Rio de Janeiro"]
      p cities
      cities.each do |city|
        place = city.css('h1').text
        if places.include? place
          p place
          beaches = city.css("[class='beach']")
          beaches.each do |beach|
            date_time = Time.now
            date_time = date_time.strftime("%Y-%m-%d 00:00:00")
            name = beach.css("[class='name']")[0].text
            description = beach.css("[class='location']")[0].text
            status = beach.css(".status")[0].text == "Própria"
            cleaning_station = CleaningStation.where("name = '#{name}' AND description = ?", description)[0]

            cleaning_value = CleaningValue.where("date_time = '#{date_time}' AND cleaning_station_id = #{cleaning_station.id}")
            unless cleaning_value.empty?
              cleaning_value[0].update(
                date_time: date_time,
                status: status
              )
              p "updated"
            else
              cleaning_value = CleaningValue.new(
                date_time: date_time,
                status: status
              )

              cleaning_value.cleaning_station = cleaning_station
              cleaning_value.save!
              p "saved"
            end
          end
        end
      end
    end
    cleaning_status
  end

  task get_wave_forecasts: :environment do
    def wave_forecast_data
      WaveForecastValue.destroy_all
      visual_stations = WaveForecastStation.all
      visual_stations.each do |visual_station|
        html_file = open(visual_station.url).read
        html_doc = Nokogiri::HTML(html_file)
        values = html_doc.css('.contorno')[0].css("#prev_ond")

        values.each_with_index do |value, idx|
          if idx == 0
            date = value.css('#tit').text.strip.split(/\n/)[1].strip
          else
            date = value.css('#tit').text.strip[-10..-1]
          end

          days = value.css('#o1')
          days.each do |day|
            hour = day.text.split("Z")[0].strip[-2..-1].to_i - 1
            date_time = DateTime.new(date[6..9].to_i, date[3..4].to_i, date[0..1].to_i, hour)
            wave = day.css('b').text.split(" ")
            wave_height = wave[0].to_f
            if wave[1] == "N"
              wave_direction = "Norte"
            elsif wave[1] == "NE" || wave[1] == "NNE"
              wave_direction = "Nordeste"
            elsif wave[1] == "E" || wave[1] == "ENE" || wave[1] == "ESE"
              wave_direction = "Leste"
            elsif wave[1] == "SE" || wave[1] == "SSE"
              wave_direction = "Sudeste"
            elsif wave[1] == "S"
              wave_direction = "Sul"
            elsif wave[1] == "SW" || wave[1] == "SSW"
              wave_direction = "Sudoeste"
            elsif wave[1] == "W" || wave[1] == "WNW" || wave[1] == "WNW"
              wave_direction = "Oeste"
            elsif wave[1] == "NW" || wave[1] == "NNW"
              wave_direction = "Noroeste"
            end

            w = WaveForecastValue.new(
              date_time: date_time,
              wave_direction: wave_direction,
              wave_height: wave_height
              )
            w.wave_forecast_station = visual_station
            w.save!

            p wave_height
            p wave_direction
            p date_time
            p hour
            p w
          end
        end
      end
    end

    wave_forecast_data

  end

  task get_ocean_forecasts: :environment do
    def ocean_forecast
      WaterForecastValue.destroy_all
      date1 = Time.now - 2.day
      date = Time.new(date1.year, date1.month, date1.day).strftime("%Y-%m-%d")

      # date = date.strftime("%Y-%m-%d")

      date_now = Time.new(date1.year, date1.month, date1.day, 12)

      html_file = open("https://tds.hycom.org/thredds/dodsC/GLBy0.08/expt_93.0/FMRC/runs/GLBy0.08_930_FMRC_RUN_#{date}T12:00:00Z.ascii?water_temp%5B0:1:59%5D%5B0:1:0%5D%5B1423:1:1423%5D%5B3954:1:3968%5D").read
      lines = html_file.split(/\n/)[13..-13]
      positions = WaterForecastStation.all
      t = 0
      lines.each do |line|
        date_model = (date_now + 3600 * t * 3).strftime("%Y-%m-%d %H:00:00")
        line = line.split(',')
        line.each_with_index do |l, idx|
          unless idx == 0
            p l
            WaterForecastValue.create(water_forecast_station_id: positions[idx - 1].id, date_time: date_model, water_temperature: l.to_f)
            p "saved #{positions[idx - 1].id}"
          end
        end
        t += 1
      end
    end
    ocean_forecast
  end

  task feed_weather_forecast: :environment do

    def direction_to_string(value)
      if value > 45 / 2 && value <= 45 + 45 / 2
        direction = "Nordeste"
      elsif value > 45 + 45 / 2 && value <= 90 + 45 / 2
        direction = "Leste"
      elsif value > 90 + 45 / 2 && value <= 180 - 45 / 2
        direction = "Sudeste"
      elsif value > 180 - 45 / 2 && value <= 180 + 45 / 2
        direction = "Sul"
      elsif value > 180 + 45 / 2 && value <= 270 - 45 / 2
        direction = "Sudoeste"
      elsif value > 270 - 45 / 2 && value <= 270 + 45 / 2
        direction = "Oeste"
      elsif value > 270 + 45 / 2 && value <= 360 - 45 / 2
        direction = "Noroeste"
      else
        direction = "Norte"
      end
    end

    def translate_description(description)
      if description == "clear sky"
        description = "Céu Limpo"
      elsif description == "few clouds"
        description = "Poucas Nuvens"
      elsif description == "overcast clouds"
        description = "Poucas Nuvens"
      elsif description == "scattered clouds"
        description = "Nuvens Esparsas"
      elsif description == "broken clouds"
        description = "Nuvens Esparsas"
      elsif description == "shower rain"
        description = "Chuva Forte"
      elsif description == "rain"
        description = "Chuva"
      elsif description == "thunderstorm"
        description = "Trovões"
      elsif description == "thunderstorm with light rain"
        description = "Trovões com chuva"
      elsif description == "thunderstorm with rain"
        description = "Trovões com chuva"
      elsif description == "thunderstorm with heavy rain"
        description = "Trovões com chuva"
      elsif description == "light thunderstorm"
        description = "Trovões"
      elsif description == "heavy thunderstorm"
        description = "Trovões"
      elsif description == "ragged thunderstorm"
        description = "Trovões"
      elsif description == "light rain" || description == "light intensity shower rain"
        description = "Chuva Fraca"
      elsif description == "moderate rain" || description == "shower shower rain"
        description = "Chuva Moderada"
      elsif description == "heavy intensity rain" || description == "heavy intensity shower rain"
        description = "Chuva Forte"
      elsif description == "very heavy rain" || description == "ragged intensity shower rain"
        description = "Chuva Muito Forte"
      elsif description == "extreme rain"
        description = "Temporal"
      elsif description == "few clouds: 11-25%"
        description = "Poucas Nuvens"
      elsif description == "few clouds: 25-50%"
        description = "Nuvens Esparsas"
      elsif description == "few clouds: 51-84%"
        description = "Nuvens Esparsas"
      elsif description == "few clouds: 85-100%"
        description = "Céu Nublado"
      end
      return description
    end

    WeatherForecastValue.destroy_all
    WeatherForecastDaily.destroy_all

    def open_weather_api
      beaches = Beach.all
      date = Time.now
      date = Time.new(Time.now.year, Time.now.month , Time.now.day ).strftime("%Y-%m-%d")
      beaches.each do |beach|
        meteo_values = RestClient.get "https://api.openweathermap.org/data/2.5/onecall?lat=#{beach.lat}&lon=#{beach.lng}&exclude=minutely&appid=#{ENV['OPENWEATHER_URL']}"
        meteo_values = JSON.parse(meteo_values)

        hourly = meteo_values["hourly"]

        hourly.each do |hour|
          date_time = Time.at(hour["dt"])
          times = [0, 3, 6, 9, 12, 15, 18, 21]
          if times.include? date_time.hour
            date_time = date_time.strftime("%Y-%m-%d %H:00:00")
            air_temperature = hour["temp"].to_f - 273
            air_temperature_feels_like = hour["feels_like"].to_f - 273
            pressure = hour["pressure"]
            humidity = hour["humidity"]
            wind_speed = hour["wind_speed"]
            wind_direction = direction_to_string(hour["wind_deg"].to_f)
            description = translate_description(hour["weather"][0]["description"])
            rain_probability = hour["pop"]
            icon = hour["weather"][0]["icon"]

            p rain_probability

            p date_time
            weather_forecast_value = WeatherForecastValue.new(
              date_time: date_time,
              wind_speed: wind_speed,
              wind_direction: wind_direction,
              rain_probability: rain_probability,
              description: description,
              air_temperature: air_temperature,
              air_temperature_feels_like: air_temperature_feels_like,
              pressure: pressure,
              humidity: humidity,
              icon: icon
            )

            weather_forecast_value.beach = beach
            weather_forecast_value.save!
          end
        end

        daily = meteo_values["daily"]

        daily.each do |day|
          date_time = Time.at(day["dt"]).strftime("%Y-%m-%d %H:00:00")
          air_temperature = day["temp"]["day"].to_f - 273
          air_temperature_min = day["temp"]["min"].to_f - 273
          air_temperature_max = day["temp"]["max"].to_f - 273
          air_temperature_feels_like = day["feels_like"]["day"].to_f - 273
          pressure = day["pressure"]
          humidity = day["humidity"]
          wind_speed = day["wind_speed"]
          wind_direction = direction_to_string(day["wind_deg"].to_f)
          description = translate_description(day["weather"][0]["description"])


          icon = day["weather"][0]["icon"]
          rain_probability = day["pop"]
          uv = day["uvi"]

          weather_forecast_daily = WeatherForecastDaily.new(
            date_time: date_time,
            wind_speed: wind_speed,
            wind_direction: wind_direction,
            rain_probability: rain_probability,
            description: description,
            air_temperature: air_temperature,
            air_temperature_feels_like: air_temperature_feels_like,
            air_temperature_min: air_temperature_min,
            air_temperature_max: air_temperature_max,
            pressure: pressure,
            humidity: humidity,
            uv: uv,
            icon: icon
          )

          weather_forecast_daily.beach = beach
          weather_forecast_daily.save!
        end
      end
    end

    open_weather_api
  end


  task feed_real_time: :environment do
    def direction_to_string(value)
      if value > 45 / 2 && value <= 45 + 45 / 2
        direction = "Nordeste"
      elsif value > 45 + 45 / 2 && value <= 90 + 45 / 2
        direction = "Leste"
      elsif value > 90 + 45 / 2 && value <= 180 - 45 / 2
        direction = "Sudeste"
      elsif value > 180 - 45 / 2 && value <= 180 + 45 / 2
        direction = "Sul"
      elsif value > 180 + 45 / 2 && value <= 270 - 45 / 2
        direction = "Sudoeste"
      elsif value > 270 - 45 / 2 && value <= 270 + 45 / 2
        direction = "Oeste"
      elsif value > 270 + 45 / 2 && value <= 360 - 45 / 2
        direction = "Noroeste"
      else
        direction = "Norte"
      end
    end

    def translate_description(description)
      if description == "clear sky"
        description = "Céu Limpo"
      elsif description == "few clouds"
        description = "Poucas Nuvens"
      elsif description == "overcast clouds"
        description = "Poucas Nuvens"
      elsif description == "scattered clouds"
        description = "Nuvens Esparsas"
      elsif description == "broken clouds"
        description = "Nuvens Esparsas"
      elsif description == "shower rain"
        description = "Chuva Forte"
      elsif description == "rain"
        description = "Chuva"
      elsif description == "thunderstorm"
        description = "Trovões"
      elsif description == "thunderstorm with light rain"
        description = "Trovões com chuva"
      elsif description == "thunderstorm with rain"
        description = "Trovões com chuva"
      elsif description == "thunderstorm with heavy rain"
        description = "Trovões com chuva"
      elsif description == "light thunderstorm"
        description = "Trovões"
      elsif description == "heavy thunderstorm"
        description = "Trovões"
      elsif description == "ragged thunderstorm"
        description = "Trovões"
      elsif description == "light rain" || description == "light intensity shower rain"
        description = "Chuva Fraca"
      elsif description == "moderate rain" || description == "shower shower rain"
        description = "Chuva Moderada"
      elsif description == "heavy intensity rain" || description == "heavy intensity shower rain"
        description = "Chuva Forte"
      elsif description == "very heavy rain" || description == "ragged intensity shower rain"
        description = "Chuva Muito Forte"
      elsif description == "extreme rain"
        description = "Temporal"
      elsif description == "few clouds: 11-25%"
        description = "Poucas Nuvens"
      elsif description == "few clouds: 25-50%"
        description = "Nuvens Esparsas"
      elsif description == "few clouds: 51-84%"
        description = "Nuvens Esparsas"
      elsif description == "few clouds: 85-100%"
        description = "Céu Nublado"
      end
      return description
    end

    def feed_real_time_data
      beaches = Beach.all

      visual_stations = VisualStation.all

      visual_values = []
      visual_stations.each do |visual_station|
        visual_values << VisualValue.where("visual_station_id = #{visual_station.id}").last
      end

      buoy_stations = BuoyStation.all

      buoys = []
      buoy_stations.each do |buoy_station|
        buoys << BuoyValue.where("buoy_station_id = #{buoy_station.id}").last
      end

      cleaning_stations = CleaningStation.all

      cleaning_values = []
      cleaning_stations.each do |cleaning_station|
        cleaning_values << CleaningValue.where("cleaning_station_id = #{cleaning_station.id}").last
      end

      water_forecast_stations = WaterForecastStation.all

      beaches.each do |beach|
        p beach
        date_time = DateTime.new(Time.now.year, Time.now.month, Time.now.day, Time.now.hour).strftime("%Y-%m-%d %H:00:00")

        distance = 9999
        visual_values.each_with_index do |visual_value, idx|
          x = Haversine.distance(beach.lat, beach.lng, visual_value.visual_station.lat, visual_value.visual_station.lng).to_miles
          if x < distance
            distance = x
            @index_visual = idx
          end
        end

        distance = 9999
        water_forecast_stations.each_with_index do |ocean_model_position, idx|
          x = Haversine.distance(beach.lat, beach.lng, ocean_model_position.lat, ocean_model_position.lng).to_miles
          if x < distance
            distance = x
            @index_water = idx
          end
        end

        distance = 9999
        cleaning_values.each_with_index do |cleaning_value, idx|
          x = Haversine.distance(beach.lat, beach.lng, cleaning_value.cleaning_station.lat, cleaning_value.cleaning_station.lng).to_miles
          if x < distance
            distance = x
            @index_cleaning = idx
          end
        end

        if beach.lng < -43.04 && beach.lng > -43.23
          wave_height = buoys[0].wave_height
          wave_direction = direction_to_string(buoys[0].wave_direction.to_f)
          wave_formation = buoys[0].wave_formation
        else
          wave_height = visual_values[@index_visual].wave_height
          wave_formation = visual_values[@index_visual].wave_formation
          wave_direction = visual_values[@index_visual].wave_direction
        end

        wind_speed = buoys[0].wind_speed
        wind_direction = buoys[0].wind_direction
        humidity = buoys[0].humidity
        pressure = buoys[0].pressure

        s = Time.now.hour % 3
        if s == 0
          date_time_1 = date_time
        else
          date_time_1 = DateTime.new(Time.now.year, Time.now.month, Time.now.day, Time.now.hour).advance(hours: 3 - s).strftime("%Y-%m-%d %H:00:00")
        end
        water_temperature = buoys[0].water_temperature
        cleaning = cleaning_values[@index_cleaning].status

        p beach.name
        forecast_value = WeatherForecastValue.where("beach_id = #{beach.id} AND date_time = '#{date_time_1}'")
        air_temperature = forecast_value[0].air_temperature
        air_temperature_feels_like = forecast_value[0].air_temperature_feels_like
        icon = forecast_value[0].icon
        description = translate_description(forecast_value[0].description)

        p "agora salvar"

        real_time_value = RealTimeValue.where("date_time = '#{date_time}' AND beach_id = #{beach.id}")

        unless real_time_value.empty?
          real_time_value[0].update(
            date_time: date_time,
            wave_height: wave_height,
            wave_direction: wave_direction,
            wave_formation: wave_formation.to_s,
            wind_speed: wind_speed,
            wind_direction: wind_direction,
            water_temperature: water_temperature,
            cleaning: cleaning,
            humidity: humidity,
            pressure: pressure,
            air_temperature: air_temperature,
            air_temperature_feels_like: air_temperature_feels_like,
            description: description,
            icon: icon,
          )
        else
          real_time_value = RealTimeValue.new(
            date_time: date_time,
            wave_height: wave_height,
            wave_direction: wave_direction,
            wave_formation: wave_formation.to_s,
            wind_speed: wind_speed,
            wind_direction: wind_direction,
            water_temperature: water_temperature,
            cleaning: cleaning,
            humidity: humidity,
            pressure: pressure,
            air_temperature: air_temperature,
            air_temperature_feels_like: air_temperature_feels_like,
            description: description,
            icon: icon,
          )

          real_time_value.beach = beach

          real_time_value.save!
        end

        p "agora salvo"
      end
    end

    feed_real_time_data

  end


  task feed_ocean_forecast: :environment do
    def feed_weather_forecast

      OceanForecastValue.destroy_all

      beaches = Beach.all


      wave_forecast_stations = WaveForecastStation.all
      water_forecast_stations = WaterForecastStation.all

      date = Time.new(Time.now.year, Time.now.month, Time.now.day, Time.now.hour).strftime("%Y-%m-%d %H:00:00")

      beaches.each do |beach|
        distance = 9999
        wave_forecast_stations.each do |forecast|
          x = Haversine.distance(beach.lat, beach.lng, forecast.lat, forecast.lng).to_miles
          if x < distance
            distance = x
            @forecast = forecast
          end
        end

        distance = 9999
        water_forecast_stations.each do |ocean_model_position|
          x = Haversine.distance(beach.lat, beach.lng, ocean_model_position.lat, ocean_model_position.lng).to_miles
          if x < distance
            distance = x
            @ocean_model_position = ocean_model_position
          end
        end

        forecast_values = WaveForecastValue.where("wave_forecast_station_id = #{@forecast.id} AND date_time >= '#{date}'")

        p "agora salvar"

        forecast_values.each do |forecast_value|
          begin
            wave_direction = forecast_value.wave_direction
          rescue
            wave_direction = nil
          end

          ocean_forecast_value = OceanForecastValue.new(
            date_time: forecast_value.date_time,
            wave_height: forecast_value.wave_height,
            wave_direction: wave_direction,
          )
          ocean_forecast_value.beach = beach
          ocean_forecast_value.save!
        end

        p "agora salvar"

        ocean_model_values = WaterForecastValue.where("water_forecast_station_id = #{@ocean_model_position.id} AND date_time >= '#{date}'")

        ocean_model_values.each do |ocean_model_value|
          ocean_forecast_value = OceanForecastValue.where("date_time = '#{ocean_model_value.date_time}' AND beach_id = #{beach.id}")
          unless ocean_forecast_value.empty?
            ocean_forecast_value[0].update(
              water_temperature: ocean_model_value.water_temperature
            )
            p ocean_forecast_value
          end
        end
        p "agora salvo"
      end
    end

    feed_weather_forecast
  end

  task feed_tides: :environment do
    def tidal_data
      date1 = Time.now - 1.day
      date = Time.new(date1.year, date1.month, date1.day).strftime("%Y-%m-%d")

      tides_values = RestClient.get "https://www.worldtides.info/api/v2?extremes&date=#{date}&lat=-22.9068&lon=-43.1729&days=7&station=UKHO:2201a&key=#{ENV['WORLDTIDE_API']}"
      tides_values = JSON.parse(tides_values)
      tides_values["extremes"].each do |value|
        tide = value["height"]
        if value["type"] == "Low"
          tide_situation = "Maré baixa"
        else
          tide_situation = "Maré alta"
        end
        date_time = Time.at(value["dt"]).strftime("%Y-%m-%d %H:00:00")

        Tide.create(
          date_time: date_time,
          tide: tide,
          tide_situation: tide_situation
          )
      end
    end

    Tide.destroy_all
    puts "Feed Tides"
    tidal_data
  end
end
