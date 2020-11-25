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

    def buoy_data
      time_start = Time.now.to_i - 3600 * 3
      time_end = Time.now.to_i
      buoy_stations = BuoyStation.all
      buoy_stations.each do |buoy_station|
        p buoy_station
        meteo_values = RestClient.get "simcosta.furg.br/api/metereo_data?boiaID=12&type=json&time1=#{time_start}&time2=#{time_end}&params=Average_wind_direction_N,Last_sampling_interval_gust_speed,Average_Pressure,Average_Air_Temperature,Instantaneous_Humidity,Average_Humidity,Average_wind_speed"
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
              wind_speed: value["Avg_Wnd_Sp"],
              wind_direction: direction_to_string(value["Avg_Wnd_Dir_N"].to_f)
            )
          else
            value = BuoyValue.new(
              date_time: date_time,
              pressure: value["Avg_Air_Press"],
              air_temperature: value["Avg_Air_Tmp"],
              humidity: value["Avg_Hmt"],
              wind_speed: value["Avg_Wnd_Sp"],
              wind_direction: direction_to_string(value["Avg_Wnd_Dir_N"].to_f)
            )
            value.buoy_station = buoy_station
            value.save!
          end
        end
        ocean_values = RestClient.get "http://simcosta.furg.br/api/oceanic_data?boiaID=12&type=json&time1=#{time_start}&time2=#{time_end}&params=Hsig_Significant_Wave_Height_m,Mean_Wave_Direction_deg,Hmax_Maximum_Wave_Height_m,TP_Peak_Period_seconds,Average_Temperature_deg_C"
        ocean_values = JSON.parse(ocean_values)
        ocean_values.each do |value|
          date_time = DateTime.new(value["YEAR"], value["MONTH"], value["DAY"], value["HOUR"], value["MINUTE"].to_i - 1, 0)
          buoy = BuoyValue.where("date_time = '#{date_time.strftime("%Y-%m-%d %H:%M:%S")}'")
          unless buoy.empty?
            buoy[0].update(
              wave_height: value["Hsig"],
              water_temperature: value["Avg_W_Tmp1"],
              wave_formation: value["TP"],
              wave_direction: value["Avg_Wv_Dir_N"]
            )
          else
            value = BuoyValue.new(
              date_time: date_time,
              wave_height: value["Hsig"],
              water_temperature: value["Avg_W_Tmp1"],
              wave_formation: value["TP"],
              wave_direction: direction_to_string(value["Avg_Wv_Dir_N"].to_f)
            )
            value.buoy_station = buoy_station
            value.save!
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
        value =  html_doc.search("[class='h5 no-margin text-primary']")
        wave_formation = value[0].text.strip.gsub(",", ".")[0...-1].to_f
        water_temperature = value[1].text[0...-2].to_f
        value = html_doc.search("[class='small line-height-xs']")
        wave_direction = value[0].text
        p wave_direction
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
        p place
        if places.include? place
          beaches = city.css("[class='beach']")
          beaches.each do |beach|
            date_time = Time.now
            date_time = date_time.strftime("%Y-%m-%d 00:00:00")
            name = beach.css("[class='name']")[0].text
            description = beach.css("[class='location']")[0].text
            status = beach.css(".status")[0].text
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

  task get_forecasts: :environment do
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
            wind = day.css('b').text.split(" ")
            wind_speed = wind[0].to_f
            if wind[1] == "N"
              wind_direction = "Norte"
            elsif wind[1] == "NE" || wind[1] == "NNE"
              wind_direction = "Nordeste"
            elsif wind[1] == "E" || wind[1] == "ENE" || wind[1] == "ESE"
              wind_direction = "Leste"
            elsif wind[1] == "SE" || wind[1] == "SSE"
              wind_direction = "Sudeste"
            elsif wind[1] == "S"
              wind_direction = "Sul"
            elsif wind[1] == "SW" || wind[1] == "SSW"
              wind_direction = "Sudoeste"
            elsif wind[1] == "W" || wind[1] == "WNW" || wind[1] == "WNW"
              wind_direction = "Oeste"
            elsif wind[1] == "NW" || wind[1] == "NNW"
              wind_direction = "Noroeste"
            end

            w = WaveForecastValue.new(
              date_time: date_time,
              wind_direction: wind_direction,
              wind_speed: wind_speed
              )
            w.wave_forecast_station = visual_station
            w.save!

            p wind_direction
            p wind_speed
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
      date = Time.now
      date = Time.new(Time.now.year, Time.now.month, Time.now.day - 1).strftime("%Y-%m-%d")

      # date = date.strftime("%Y-%m-%d")

      date_now = Time.new(Time.now.year, Time.now.month, Time.now.day, 12)

      begin
        x = WaterForecastValue.first.date_time.strftime("%Y-%m-%d %H:00:00") == date_now.strftime("%Y-%m-%d %H:00:00")
      rescue
        x = false
      end
      unless x
        begin
          html_file = open("https://tds.hycom.org/thredds/dodsC/GLBy0.08/expt_93.0/FMRC/runs/GLBy0.08_930_FMRC_RUN_#{date}T12:00:00Z.ascii?water_temp%5B0:1:60%5D%5B0:1:0%5D%5B1425:1:1425%5D%5B3954:1:3968%5D").read
          lines = html_file.split(/\n/)[13..-13]
          positions = WaterForecastStation.all
          WaterForecastValue.destroy_all
          t = 0
          lines.each do |line|
            date_model = (date_now + 3600 * t).strftime("%Y-%m-%d %H:00:00")
            line = line.split(',')
            line.each_with_index do |l, idx|
              unless idx == 0
                OceanModelValue.create(ocean_model_position_id: positions[idx - 1].id, date_time: date_model, water_temperature: l.to_f)
                p "saved #{positions[idx - 1].id}"
              end
            end
            t += 1
          end
        rescue
          puts "Não há dados novos"
        end
      end
    end

    ocean_forecast
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
        cleaning_values.each_with_index do |cleaning_value, idx|
          x = Haversine.distance(beach.lat, beach.lng, cleaning_value.cleaning_station.lat, cleaning_value.cleaning_station.lng).to_miles
          if x < distance
            distance = x
            @index_cleaning = idx
          end
        end

        if beach.lng < -43.04 && beach.lng > -43.23
          wave_height = buoys[0].wave_height
          begin
            wave_direction = direction_to_string(buoys[0].wave_direction)
          rescue
            wave_direction = nil
          end
          wave_formation = buoys[0].wave_formation
        else
          wave_height = visual_values[@index_visual].wave_height
          wave_formation = visual_values[@index_visual].wave_formation
          wave_direction = visual_values[@index_visual].wave_dir
        end

        air_temperature = weather_values[@index_weather].air_temperature
        humidity = weather_values[@index_weather].humidity
        wind_speed = weather_values[@index_weather].wind_speed

        begin
          wind_direction = direction_to_string(weather_values[@index_weather].wind_dir)
        rescue
          wind_direction = nil
        end

        rain = weather_values[@index_weather].rain
        pressure = weather_values[@index_weather].pressure

        cleaning = cleaning_values[@index_cleaning].status == "Própria"

        water_temperature = visual_values[@index_visual].water_temperature

        tide = 0.1
        tide_situation = "baixa"

        p "agora salvar"

        real_time_value = RealTimeValue.where("date_time = '#{date_time}' AND beach_id = #{beach.id}")

        p wave_direction
        p wave_height
        p water_temperature
        unless real_time_value.empty?
          real_time_value[0].update(
            date_time: date_time,
            wave_height: wave_height,
            wave_direction: wave_direction,
            wave_formation: wave_formation.to_s,
            wind_speed: wind_speed,
            wind_direction: wind_direction,
            rain: rain.to_s,
            humidity: humidity.to_i,
            pressure: pressure,
            air_temperature: air_temperature,
            water_temperature: water_temperature,
            cleaning: cleaning,
            tide: tide,
            tide_situation: tide_situation
          )
        else
          real_time_value = RealTimeValue.new(
            date_time: date_time,
            wave_height: wave_height,
            wave_direction: wave_direction,
            wave_formation: wave_formation.to_s,
            wind_speed: wind_speed,
            wind_direction: wind_direction,
            rain: rain.to_s,
            humidity: humidity.to_i,
            pressure: pressure,
            air_temperature: air_temperature,
            water_temperature: water_temperature,
            cleaning: cleaning,
            tide: tide,
            tide_situation: tide_situation
          )

          real_time_value.beach = beach

          real_time_value.save!
        end

        p "agora salvo"
      end
    end

    feed_real_time_data
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


    def open_weather_api
      beaches = Beach.all
      WeatherForecastValue.destroy_all
      WeatherForecastDaily.destroy_all
      beaches.each do |beach|
        meteo_values = RestClient.get "https://api.openweathermap.org/data/2.5/onecall?lat=#{beach.lat}&lon=#{beach.lng}&exclude=minutely&appid=39352aa3ee983b59623430b39d23fe25"
        meteo_values = JSON.parse(meteo_values)

        hourly = meteo_values["hourly"]

        hourly.each do |hour|
          date_time = Time.at(hour["dt"]).strftime("%Y-%m-%d %H:00:00")
          air_temperature = hour["temp"].to_f - 273
          air_temperature_feels_like = hour["feels_like"].to_f - 273
          pressure = hour["pressure"]
          humidity = hour["humidity"]
          wind_speed = hour["wind_speed"]
          wind_direction = direction_to_string(hour["wind_deg"].to_f)
          description = hour["weather"][0]["description"]
          rain_probability = hour["pop"]
          icon = hour["weather"][0]["icon"]

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
          description = day["weather"][0]["description"]
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
end
