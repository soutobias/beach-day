# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Users

require 'faker'

User.destroy_all

user_index = 1
10.times do
  puts "Creating user #{user_index}"
  admin_priviledges = user_index == 1
  user_name = User.new(
    email: "#{user_index}@gmail.com",
    password: '123abc',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    admin: admin_priviledges
  )
  puts "Saving user #{user_index}"
  user_name.save!
  puts "User #{user_index} saved"
  user_index += 1
end

# Create Beaches

Beach.destroy_all

Beach.create(name: "Prainha - Canto Direito", lat: "-23.0423", lng:  "-43.5072")
Beach.create(name: "Macumba - CCB", lat: "-23.0316", lng: "-43.4761")
Beach.create(name: "Recreio - Canto", lat: "-23.0299", lng: "-43.4673")
Beach.create(name: "Barra - Posto 6 - Quiosque Piratas - BarraBela", lat:  "-23.011", lng: "-43.3451")
Beach.create(name: "Rico Point Barra direcao P5", lat:  "-23.0112", lng:  "-43.3387")
Beach.create(name: "Prainha", lat: "-23.0408", lng:  "-43.5048")
Beach.create(name: "Macumba - Rico Point", lat: "-23.0315", lng:  "-43.4761")
Beach.create(name: "Recreio - Posto 11", lat:  "-23.0298", lng:  "-43.4666")
Beach.create(name: "Barra - Rico Point - Posto 55", lat:  "-23.0112", lng:  "-43.3387")
Beach.create(name: "Barra Posto 4 - Hotel WYNDHAM", lat: "-23.0123", lng: " -43327")
Beach.create(name: "Macumba - Secreto", lat: "-23.0369", lng:  "-43.4954")
Beach.create(name: "Macumba - 2W", lat: "-23.0345", lng:  "-43.4883")
Beach.create(name: "Recreio - Posto 10", lat:  "-23.0262", lng:  "-43.4579")
Beach.create(name: "Rico Point Barra direcao P6", lat:  "-23.0113", lng:  "-43.3374")
Beach.create(name: "Sao Conrado - Canto Esquerdo", lat:  "-22.9995", lng:  "-43.2561")
Beach.create(name: "Ipanema - Posto 8", lat: "-22.9881", lng:  "-43.1971")
Beach.create(name: "Copacabana - Posto" "6, lat:  -22985"  "-43, lng:.1887")
Beach.create(name: "Leblon - Canto", lat:  "-22.9881", lng:  "-43.2233")
Beach.create(name: "Arpoador", lat:  "-22.9895", lng:  "-43.1919")
Beach.create(name: "Copacabana - Posto 5", lat:  "-22.9806", lng:  "-43.1888")
Beach.create(name: "Ipanema - Garcia davila", lat: "-22.9873", lng:  "-43.2093")
Beach.create(name: "Praia do Diabo", lat:  "-22.9886", lng:  "-43.1896")
Beach.create(name: "Praia do Leme", lat: "-22.9648", lng:  "-43.1688")
Beach.create(name: "Itacoatiara - Pampo", lat: "-22.9746", lng:  "-43.0364")
Beach.create(name: "Itacoatiara - Meio", lat:  "-22.9748", lng:  "-43.0336")
Beach.create(name: "Itacoatiara - Costao", lat:  "-22.9758", lng:  "-43.0305")

RealTimeValue.destroy_all
WeatherForecastValue.destroy_all

beaches = Beach.all

date_time_past = []
date_time_future = []
c = 9
d = 0
10.times do
  date_time_past << DateTime.strptime((Time.now.to_i - (3600 * c)).to_s, '%s')
  c -= 1
  date_time_future << DateTime.strptime((Time.now.to_i + (3600 * d * 24)).to_s, '%s')
  d += 1
end

beaches.each do |beach|
  date_time_past.each do |date_time|
    r = RealTimeValue.new(
      date_time: date_time,
      wave_height: (1..5).to_a.sample,
      wave_direction:  ["norte", "nordeste", "leste", "sudeste", "sul", "sudoeste", "oeste", "noroeste"].sample,
      wave_formation:  ["regular", "mal formado", "ondas perfeitas"].sample,
      wind_speed: (1..30).to_a.sample,
      wind_direction:  ["norte", "nordeste", "leste", "sudeste", "sul", "sudoeste", "oeste", "noroeste"].sample,
      rain:  ["sem chuva", "sem chuva", "sem chuva", "chuvas esparsas", "muita chuva", "temporal"].sample,
      humidity: (20..100).to_a.sample,
      pressure: (1000..1100).to_a.sample,
      water_temperature: (15..30).to_a.sample,
      air_temperature: (20..40).to_a.sample,
      cleaning: [true, false].sample,
      tide: (0..2).to_a.sample,
      tide_situation: ["mare baixa", "mare alta", "mare subindo", "mare descendo"].sample,
      description: ["dia ensolarado", "nuvens e chuvas esparsas", "muita chuva"].sample
    )
    r.beach = beach
    r.save!
  end

  date_time_future.each do |date_time|
    w = WeatherForecastValue.new(
      date_time: date_time,
      wave_height: (1..5).to_a.sample,
      wave_direction:  ["norte", "nordeste", "leste", "sudeste", "sul", "sudoeste", "oeste", "noroeste"].sample,
      wave_formation:  ["regular", "mal formado", "ondas perfeitas"].sample,
      wind_speed: (1..30).to_a.sample,
      wind_direction:  ["norte", "nordeste", "leste", "sudeste", "sul", "sudoeste", "oeste", "noroeste"].sample,
      rain: (0..20).to_a.sample,
      rain_probability: (20..100).to_a.sample,
      humidity: (20..100).to_a.sample,
      pressure: (1000..1100).to_a.sample,
      water_temperature: (15..30).to_a.sample,
      air_temperature: (20..40).to_a.sample,
      description: ["dia ensolarado", "nuvens e chuvas esparsas", "muita chuva"]
    )
    w.beach = beach
    w.save!
  end
end
