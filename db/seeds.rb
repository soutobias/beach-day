# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Users (first one is Administrator)

require 'faker'
require 'open-uri'

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

# Create Beaches (26)

Beach.destroy_all

beach_index = 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Prainha - Canto Direito",
  lat: "-23.0423",
  lng: "-43.5072",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Macumba - CCB",
  lat: "-23.0316",
  lng: "-43.4761",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Recreio - Canto",
  lat: "-23.0299",
  lng: "-43.4673",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Barra - Posto 6 - Quiosque Piratas - BarraBela",
  lat: "-23.011",
  lng: "-43.3451",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Rico Point Barra direcao P5",
  lat: "-23.0112",
  lng: "-43.3387",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Prainha",
  lat: "-23.0408",
  lng: "-43.5048",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Macumba - Rico Point",
  lat: "-23.0315",
  lng: "-43.4761",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Recreio - Posto 11",
  lat: "-23.0298",
  lng: "-43.4666",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Barra - Rico Point - Posto 55",
  lat: "-23.0112",
  lng: "-43.3387",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Barra Posto 4 - Hotel WYNDHAM",
  lat: "-23.0123",
  lng: "-43.327",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Macumba - Secreto",
  lat: "-23.0369",
  lng: "-43.4954",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Macumba - 2W",
  lat: "-23.0345",
  lng: "-43.4883",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Recreio - Posto 10",
  lat: "-23.0262",
  lng: "-43.4579",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Rico Point Barra direcao P6",
  lat: "-23.0113",
  lng: "-43.3374",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Sao Conrado - Canto Esquerdo",
  lat: "-22.9995",
  lng: "-43.2561",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Ipanema - Posto 8",
  lat: "-22.9881",
  lng: "-43.1971",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Copacabana - Posto 6",
  lat: "-22.985",
  lng: "-43.1887",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Leblon - Canto",
  lat: "-22.9881",
  lng: "-43.2233",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Arpoador",
  lat: "-22.9895",
  lng: "-43.1919",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Copacabana - Posto 5",
  lat: "-22.9806",
  lng: "-43.1888",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Ipanema - Garcia davila",
  lat: "-22.9873",
  lng: "-43.2093",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Praia do Diabo",
  lat: "-22.9886",
  lng: "-43.1896",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Praia do Leme",
  lat: "-22.9648",
  lng: "-43.1688",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Itacoatiara - Pampo",
  lat: "-22.9746",
  lng: "-43.0364",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Itacoatiara - Meio",
  lat: "-22.9748",
  lng: "-43.0336",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://s3.glbimg.com/v1/AUTH_e23cd0767cb84b2c865c204683cba493/bulletins/67216f1a-b2cd-42d7-bc77-12bbe4214565.jpg')
beach = Beach.new(
  name: "Itacoatiara - Costao",
  lat: "-22.9758",
  lng: "-43.0305",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample,
  overall_rating: (0..10).to_a.sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

VisualValue.destroy_all
VisualStation.destroy_all


VisualStation.create(lat: -23.0369, lng: -43.4954, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/macumba-secreto', place: true)
VisualStation.create(lat: -23.0345, lng: -43.4883, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/macumba-3w', place: true)
VisualStation.create(lat: -23.0298, lng: -43.4666, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/recreio-posto-11', place: true)
VisualStation.create(lat: -23.0123, lng: -43.327, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/barra-posto-4', place: true)
VisualStation.create(lat: -23.0423, lng: -43.5072, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/prainha-canto-direito', place: true)
VisualStation.create(lat: -23.0316, lng: -43.4761, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/macumba-ccb', place: true)
VisualStation.create(lat: -23.0315, lng: -43.4761, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/macumba-rico-point', place: true)
VisualStation.create(lat: -23.0262, lng: -43.4579, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/recreio-posto-10', place: true)
VisualStation.create(lat: -23.0299, lng: -43.4673, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/recreio-canto', place: true)
VisualStation.create(lat: -23.0408, lng: -43.5048, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/prainha', place: true)
VisualStation.create(lat: -22.9746, lng: -43.0364, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/itacoatiara-pampo', place: true)
VisualStation.create(lat: -22.9748, lng: -43.0336, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/itacoatiara-meio', place: true)
VisualStation.create(lat: -22.9758, lng: -43.0305, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/itacoatiara-costao', place: true)
VisualStation.create(lat: -22.9995, lng: -43.2561, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/sao-conrado-canto-esquerdo', place: true)
VisualStation.create(lat: -22.9881, lng: -43.1971, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/ipanema-posto-8', place: true)
VisualStation.create(lat: -22.985, lng: -43.1887, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/copacabana-posto-6', place: true)
VisualStation.create(lat: -22.9881, lng: -43.2233, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/leblon-canto', place: true)
VisualStation.create(lat: -22.9895, lng: -43.1919, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/arpoador', place: true)
VisualStation.create(lat: -22.9806, lng: -43.1888, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/copacabana-posto-5', place: true)
VisualStation.create(lat: -22.9873, lng: -43.2093, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/ipanema-garcia-davila', place: true)
VisualStation.create(lat: -22.9886, lng: -43.1896, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/praia-diabo', place: true)
VisualStation.create(lat: -22.9648, lng: -43.1688, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/praia-leme', place: true)
VisualStation.create(lat: -23.048129, lng: -43.512599, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/grumari-canto-esquerdo', place: true)
VisualStation.create(lat: -23.032061, lng: -43.472204, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/macumba-farofa-posto12', place: true)
VisualStation.create(lat: -23.031458, lng: -43.476754, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/macumba-curvao', place: true)

VisualStation.create(lat: -23.053, lng: -43.534, url: "http://www.waves.com.br/surf/ondas/picos/grumari/")
VisualStation.create(lat: -23.043, lng: -43.505, url: "http://www.waves.com.br/surf/ondas/picos/prainha-7/")
VisualStation.create(lat: -23.034, lng: -43.476, url: "http://www.waves.com.br/surf/ondas/picos/macumba/")
VisualStation.create(lat: -23.0168, lng: -43.4048, url: "http://www.waves.com.br/surf/ondas/picos/reserva/")
VisualStation.create(lat: -23.031, lng: -43.465, url: "http://www.waves.com.br/surf/ondas/picos/recreio/")
VisualStation.create(lat: -23.0124, lng: -43.3277, url: "http://www.waves.com.br/surf/ondas/picos/postinho-da-barra/")
VisualStation.create(lat: -22.99, lng: -43.226, url: "http://www.waves.com.br/surf/ondas/picos/leblon/")
VisualStation.create(lat: -22.989, lng: -43.208, url: "http://www.waves.com.br/surf/ondas/picos/ipanema/")
VisualStation.create(lat: -22.9899, lng: -43.1925, url: "http://www.waves.com.br/surf/ondas/picos/arpoador-2/")
VisualStation.create(lat: -22.9886, lng: -43.1889, url: "http://www.waves.com.br/surf/ondas/picos/diabo/")
VisualStation.create(lat: -22.9744, lng: -43.1835, url: "http://www.waves.com.br/surf/ondas/picos/copacabana/")
VisualStation.create(lat: -22.9759, lng: -43.0364, url: "http://www.waves.com.br/surf/ondas/picos/itacoatiara-pampo/")
VisualStation.create(lat: -22.9757, lng: -43.0335, url: "http://www.waves.com.br/surf/ondas/picos/itacoatiara-meio/")
VisualStation.create(lat: -22.9769, lng: -43.0312, url: "http://www.waves.com.br/surf/ondas/picos/itacoatiara-costao/")
VisualStation.create(lat: -22.936, lng: -42.496, url: "http://www.waves.com.br/surf/ondas/picos/praia-da-vila/")
VisualStation.create(lat: -22.9403, lng: -42.4777, url: "http://www.waves.com.br/surf/ondas/picos/itauna/")
VisualStation.create(lat: -22.886, lng: -42.011, url: "http://www.waves.com.br/surf/ondas/picos/praia-do-forte/")
VisualStation.create(lat: -22.86, lng: -42.02, url: "http://www.waves.com.br/surf/ondas/picos/pero/")
VisualStation.create(lat: -22.781, lng: -41.91, url: "http://www.waves.com.br/surf/ondas/picos/geriba-canto-direito/")
VisualStation.create(lat: -22.788, lng: -41.921, url: "http://www.waves.com.br/surf/ondas/picos/geriba-meio/")
VisualStation.create(lat: -22.972, lng: -42.038, url: "http://www.waves.com.br/surf/ondas/picos/praia-grande/")
VisualStation.create(lat: -22.95, lng: -42.02, url: "http://www.waves.com.br/surf/ondas/picos/chamine/")
VisualStation.create(lat: -22.95, lng: -42.02, url: "http://www.waves.com.br/surf/ondas/picos/estacionamento/")

Buoy.destroy_all
BuoyStation.destroy_all

BuoyStation.create(lat: -22.971667, lng: -43.1502778)

WeatherValue.destroy_all
WeatherStation.destroy_all

WeatherStation.create(name: "A652", lat: -22.99, lng: -43.19)
WeatherStation.create(name: "A627", lat: -22.87, lng: -43.1)


CleaningValue.destroy_all
CleaningStation.destroy_all

CleaningStation.create(name: "Arpoador", description: "Canto esquerdo da praia", lat: -22.989251295724323, lng: -43.191976335078834)
CleaningStation.create(name: "Barra da Tijuca", description: "Em frente à Avenida Ayrton Senna", lat: -23.011303016973518, lng: -43.3660065096027)
CleaningStation.create(name: "Barra da Tijuca", description: "Em frente ao Riviera Country Club", lat: -23.011204265754436, lng: -43.3349465293176)
CleaningStation.create(name: "Barra da Tijuca", description: "Em frente ao 2º GBM (Bombeiros)", lat: -23.015520846665986, lng: -43.30241897354598)
CleaningStation.create(name: "Barra da Tijuca", description: "Quebra-Mar - Em frente à Rua Sargento João de Faria", lat: -23.015125853707, lng: -43.297912862482065)
CleaningStation.create(name: "Barra de Guaratiba", description: "Em frente à Escola Ana Neri", lat: -23.06983988066319, lng: -43.567762271457894)
CleaningStation.create(name: "Prainha", description: "Centro da praia", lat: -23.041290417206273, lng: -43.505771057183864)
CleaningStation.create(name: "Grumari", description: "Canto direito da praia", lat: -23.049543927180483, lng: -43.53162755184641)
CleaningStation.create(name: "Grumari", description: "Centro da praia", lat: -23.048122306048374, lng: -43.51737965781574)
CleaningStation.create(name: "Pontal de Sernambetiba", description: "Em frente ao canal de Sernambetiba", lat: -23.035879947304224, lng: -43.49364747247595)
CleaningStation.create(name: "Pontal de Sernambetiba", description: "Em frente ao nº 6.287 da Estrada do Pontal", lat: -23.034082991382483, lng: -43.48785390110805)
CleaningStation.create(name: "Recreio", description: "Em frente à Rua Manuel Jorge Lydia", lat: -23.028830213502225, lng: -43.464851276271915)
CleaningStation.create(name: "Recreio", description: "Canto direito da Reserva Biológica de Marapendi", lat: -23.021799859556065, lng: -43.44322194271093)
CleaningStation.create(name: "Recreio", description: "Canto esquerdo da Reserva Biológica de Marapendi", lat: -23.01271515155276, lng: -43.38477124399278)
CleaningStation.create(name: "Diabo", description: "Centro da praia", lat: -22.98865869051998, lng: -43.18970182187513)
CleaningStation.create(name: "Joatinga", description: "Centro da praia", lat: -23.01473327880434, lng: -43.290242756348825)
CleaningStation.create(name: "Leblon", description: "Em frente à Rua Rita Ludolf", lat: -22.988517897112736, lng: -43.22627743578912)
CleaningStation.create(name: "Leblon", description: "Em frente à Rua Bartolomeu Mitre", lat: -22.987752444044226, lng: -43.2222004780547)
CleaningStation.create(name: "Leblon", description: "Em frente à Rua Afrânio de Melo Franco", lat: -22.987493176663914, lng: -43.21738323065561)
CleaningStation.create(name: "Pepino", description: "Em frente à Avenida Princesa Diana de Galles", lat: -23.00108552185972, lng: -43.269192779864014)
CleaningStation.create(name: "São Conrado", description: "Em frente ao nº 220 da Avenida Prefeito Mendes de Morais", lat: -22.99932760625585, lng: -43.257820213845555)
CleaningStation.create(name: "São Conrado", description: "Canto esquerdo da praia, próximo ao costão rochoso", lat: -22.998912813842473, lng: -43.25372179854456)
CleaningStation.create(name: "Ipanema", description: "Em frente à Rua Paul Redefern", lat: -22.9872758855776, lng: -43.213585222717754)
CleaningStation.create(name: "Ipanema", description: "Em frente à Rua Garcia D'Ávila", lat: -22.98721168586308, lng: -43.209382201161965)
CleaningStation.create(name: "Ipanema", description: "Em frente à Rua Joana Angélica", lat: -22.98730304698499, lng: -43.2051657685875)
CleaningStation.create(name: "Copacabana", description: "Em frente à Rua Francisco Otaviano", lat: -22.985152942787245, lng: -43.18869693195332)
CleaningStation.create(name: "Copacabana", description: "Em frente à Rua Souza Lima", lat: -22.981849035332417, lng: -43.188934307432376)
CleaningStation.create(name: "Copacabana", description: "Em frente à Rua Santa Clara", lat: -22.974322343506103, lng: -43.18435845885758)
CleaningStation.create(name: "Copacabana", description: "Em frente à Rua República do Peru", lat: -22.970008887316478, lng: -43.179696942454534)
CleaningStation.create(name: "Leme", description: "Em frente à Rua Aurelino Leal", lat: -22.965188269730604, lng: -43.16941871745817)
CleaningStation.create(name: "Vermelha", description: "Centro da praia", lat: -22.955250142867826, lng: -43.16435470679382)
CleaningStation.create(name: "Vidigal", description: "Centro da praia", lat: -22.99179201183994, lng: -43.23208173612224)
CleaningStation.create(name: "Botafogo", description: "Em frente à Rua Marquês de Olinda", lat: -22.94426400767259, lng: -43.17970767113659)
CleaningStation.create(name: "Botafogo", description: "Em frente à comporta de Botafogo", lat: -22.947623172364956, lng: -43.180480147318974)
CleaningStation.create(name: "Flamengo", description: "Foz do rio Carioca", lat: -22.93511480093811, lng: -43.171060229328184)
CleaningStation.create(name: "Flamengo", description: "Em frente à Rua Corrêa Dutra", lat: -22.92859339071708, lng: -43.17048087215316)
CleaningStation.create(name: "Urca", description: "Centro da praia", lat: -22.947845467099466, lng: -43.16344275569807)
CleaningStation.create(name: "Imbuca", description: "Em frente à Rua Frei Leopoldo", lat: -22.76700946258972, lng: -43.10513689640853)
CleaningStation.create(name: "Ribeira", description: "À esquerda do Farol de Paquetá", lat: -22.765827254522243, lng: -43.10369386790752)
CleaningStation.create(name: "Grossa", description: "Em frente à Igreja Matriz de Paquetá", lat: -22.760529452138407, lng: -43.10753479117582)
CleaningStation.create(name: "Tamoios", description: "À esquerda da Ladeira do Vicente", lat: -22.757363533667384, lng: -43.108478928749264)
CleaningStation.create(name: "Catimbau", description: "Em frente à Travessa Dois Irmãos n° 195", lat: -22.749804606795927, lng: -43.10544803259033)
CleaningStation.create(name: "J. Bonifácio", description: "Em frente à ETE Paquetá CEDAE", lat: -22.761172520508854, lng: -43.11105921380682)

CleaningStation.create(name: "Adão", description: "Centro da praia", lat: -22.92773303773431, lng: -43.12289080465795)
CleaningStation.create(name: "Camboinhas", description: "Centro da praia", lat: -22.962056778661623, lng: -43.056578166471)
CleaningStation.create(name: "Camboinhas", description: "À 100m do Canal da Lagoa de Itaipu", lat: -22.96677872425047, lng: -43.048402793398196)
CleaningStation.create(name: "Charitas", description: "Em frente à Travessa Santa Cândida", lat: -22.930470109464284, lng: -43.09804282047324)
CleaningStation.create(name: "Charitas", description: "Lado direito do Clube Naval de Charitas", lat: -22.935479696790207, lng: -43.104630325813844)
CleaningStation.create(name: "Charitas", description: "Em frente à Avenida Quintino Bocaiúva n° 355", lat: -22.92546025169957, lng: -43.09579547613986)
CleaningStation.create(name: "Eva", description: "Centro da praia", lat: -22.929699387253148, lng: -43.12280497397102)

CleaningStation.create(name: "Boa Viagem", description: "Centro da praia", lat: -22.90804989048639, lng: -43.12888871521811)
CleaningStation.create(name: "Flechas", description: "Em frente à Rua Nilo Peçanha", lat: -22.90572744536363, lng: -43.124940503525984)
CleaningStation.create(name: "Flechas", description: "Em frente à Rua Praia de Icaraí n° 163", lat: -22.905579202836517, lng: -43.121088851391235)
CleaningStation.create(name: "Gragoatá", description: "Centro da praia", lat: -22.90223876167349, lng: -43.136141408298435)
CleaningStation.create(name: "Icaraí", description: "À esquerda da Pedra de Itapuca", lat: -22.904749139850797, lng: -43.11810104477682)
CleaningStation.create(name: "Icaraí", description: "Em frente à Praça Getúlio Vargas", lat: -22.904877617507754, lng: -43.11604110826401)
CleaningStation.create(name: "Icaraí", description: "Em frente à Rua Otávio Carneiro", lat: -22.90874918503181, lng: -43.11246304148116)
CleaningStation.create(name: "Icaraí", description: "Em frente à Rua Mariz e Barros", lat: -22.911214873691986, lng: -43.110513075537625)
CleaningStation.create(name: "Jurujuba", description: "Saída da Alameda Mal.Pessoa Leal na Av.Carlos Ermelindo Martins, 1565", lat: -22.931221065301436, lng: -43.116453503076634)
CleaningStation.create(name: "Jurujuba", description: "Em frente à Avenida Carlos Ermelindo Marins n° 1935", lat: -22.93458055372498, lng: -43.11282715648674)
CleaningStation.create(name: "São Francisco", description: "Em frente à Rua Caraíbas", lat: -22.91554083836005, lng: -43.09586016765691)
CleaningStation.create(name: "São Francisco", description: "Em frente à Avenida Quintino Bocaiúva n° 233", lat: -22.918535085904768, lng: -43.095034047295194)
CleaningStation.create(name: "São Francisco", description: "Em frente à Igreja São Francisco", lat: -22.920746746171993, lng: -43.09480842322468)
CleaningStation.create(name: "Itacoatiara", description: "Em frente à Rua das Azaléias", lat: -22.974542903680117, lng: -43.036214835597455)
CleaningStation.create(name: "Itacoatiara", description: "Em frente à Rua das Papoulas", lat: -22.97578750164196, lng: -43.03048563724476)
CleaningStation.create(name: "Itaipu", description: "Em frente ao Restaurante Varandão", lat: -22.969880498251822, lng: -43.046772010346494)
CleaningStation.create(name: "Itaipu", description: "Em frente à Praia de Itaipú n° 21", lat: -22.971836357371163, lng: -43.046042449507574)
CleaningStation.create(name: "Piratininga", description: "Em frente à Avenida Doutor Acúrcio Torres", lat: -22.953125405236328, lng: -43.098997686753705)
CleaningStation.create(name: "Piratininga", description: "Em frente à Rua General Rubens Rosado Teixeira", lat: -22.95411333880743, lng: -43.09458813521258)
CleaningStation.create(name: "Piratininga", description: "Em frente à Rua Orestes Barbosa", lat: -22.954909336136677, lng: -43.08775079957785)
CleaningStation.create(name: "Piratininga", description: "Em frente à Rua João Gomes da Silva", lat: -22.95659373636382, lng: -43.073830134751304)


beaches = Beach.all

beaches.each do |beach|
  3.times do
  r = Review.new(
    beach_id: beach.id,
    title: ["Melhor praia da vida!", "Praia mais suja que já visitei!", "Que espetáculo", "Sonhooooooo!", "Surf do bom", "Praia lotada! Nunca mais!"].sample,
    content: ["Praia vazia, calma, ondas excelentes para quem procura um surf power, e sem muitos ambulantes.",
    "Vista maravilhosa, brisa da boa, recomendo passar o dia inteiro", "Praia suja, ambulante berrando no seu ouvido, lotada...nunca mais"].sample,
    parking: (1..10).to_a.sample,
    restaurant: (1..10).to_a.sample,
    public_transportation: (1..10).to_a.sample,
    security: (1..10).to_a.sample,
    cleaning: (1..10).to_a.sample,
    rent_equipment: (1..10).to_a.sample,
    wave: (1..10).to_a.sample,
    wind: (1..10).to_a.sample,
    accessibility: (1..10).to_a.sample,
    sand_strip: (1..10).to_a.sample,
  )
  r.save!
  end
end

RealTimeValue.destroy_all

WeatherForecastValue.destroy_all

OceanModelPosition.destroy_all

lons = [-43.6800537109375, -43.5999755859375, -43.52001953125, -43.43994140625, -43.3599853515625, -43.280029296875, -43.199951171875, -43.1199951171875, -43.0400390625, -42.9599609375, -42.8800048828125, -42.800048828125, -42.719970703125, -42.6400146484375, -42.56005859375]

lons.each do |lng|
  OceanModelPosition.create!(lat: -23, lng: lng)
end

Forecast.destroy_all

Forecast.create(
  station: 606653,
  lat: -0.22883e2,
  lng: -0.43149e2
  )
Forecast.create(
  station: 926830,
  lat: -0.228194e2,
  lng: -0.431933e2,
  )
Forecast.create(
  station: 606652,
  lat: -0.22921e2,
  lng: -0.43147e2,
  )
Forecast.create(
  station: 606651,
  lat: -0.22987e2,
  lng: -0.43123e2,
  )
Forecast.create(
  station: 579550,
  lat: -0.229838e2,
  lng: -0.432074e2,
  )
Forecast.create(
  station: 589498,
  lat: -0.230155e2,
  lng: -0.43307e2,
  )
Forecast.create(
  station: 586608,
  lat: -0.230129e2,
  lng: -0.433167e2,
  )
Forecast.create(
  station: 378046,
  lat: -0.230331e2,
  lng: -0.434825e2,
  )
Forecast.create(
  station: 378045,
  lat: -0.230508e2,
  lng: -0.435316e2,
)
