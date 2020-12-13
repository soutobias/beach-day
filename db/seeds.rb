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

puts "Feed wave forecast stations"

WaveForecastValue.destroy_all
WaveForecastStation.destroy_all

WaveForecastStation.create(lat: -22.95459506134477, lng: -43.093885405166375, url: "http://ondas.cptec.inpe.br/cidades/faces/cidade.jsp?idCid=3464")
WaveForecastStation.create(lat: -22.964869106191138, lng: -43.16907308800976, url: "http://ondas.cptec.inpe.br/cidades/faces/cidade.jsp?idCid=241")

puts "Feed water forecast stations"

WaterForecastValue.destroy_all
WaterForecastStation.destroy_all

lons = [-43.6800537109375, -43.5999755859375, -43.52001953125, -43.43994140625, -43.3599853515625, -43.280029296875, -43.199951171875, -43.1199951171875, -43.0400390625, -42.9599609375, -42.8800048828125, -42.800048828125, -42.719970703125, -42.6400146484375, -42.56005859375]
lons.each do |lng|
  WaterForecastStation.create!(lat: -23, lng: lng)
end

RealTimeValue.destroy_all
OceanForecastValue.destroy_all

WeatherForecastValue.destroy_all
WeatherForecastDaily.destroy_all

puts "Feed visual stations"

VisualValue.destroy_all
VisualStation.destroy_all

VisualStation.create(lat: -23.0369, lng: -43.4954, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/macumba-secreto')
VisualStation.create(lat: -23.0345, lng: -43.4883, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/macumba-3w')
VisualStation.create(lat: -23.0298, lng: -43.4666, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/recreio-posto-11')
VisualStation.create(lat: -23.0123, lng: -43.327, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/barra-posto-4')
VisualStation.create(lat: -23.0423, lng: -43.5072, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/prainha-canto-direito')
VisualStation.create(lat: -23.0316, lng: -43.4761, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/macumba-ccb')
VisualStation.create(lat: -23.0315, lng: -43.4761, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/macumba-rico-point')
VisualStation.create(lat: -23.0262, lng: -43.4579, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/recreio-posto-10')
VisualStation.create(lat: -23.0299, lng: -43.4673, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/recreio-canto')
VisualStation.create(lat: -23.0408, lng: -43.5048, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/prainha')
VisualStation.create(lat: -22.9746, lng: -43.0364, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/itacoatiara-pampo')
VisualStation.create(lat: -22.9748, lng: -43.0336, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/itacoatiara-meio')
VisualStation.create(lat: -22.9758, lng: -43.0305, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/itacoatiara-costao')
VisualStation.create(lat: -22.9995, lng: -43.2561, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/sao-conrado-canto-esquerdo')
VisualStation.create(lat: -22.9881, lng: -43.1971, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/ipanema-posto-8')
VisualStation.create(lat: -22.985, lng: -43.1887, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/copacabana-posto-6')
VisualStation.create(lat: -22.9881, lng: -43.2233, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/leblon-canto')
VisualStation.create(lat: -22.9895, lng: -43.1919, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/arpoador')
VisualStation.create(lat: -22.9806, lng: -43.1888, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/copacabana-posto-5')
VisualStation.create(lat: -22.9873, lng: -43.2093, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/ipanema-garcia-davila')
VisualStation.create(lat: -22.9886, lng: -43.1896, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/praia-diabo')
VisualStation.create(lat: -22.9648, lng: -43.1688, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/praia-leme')
VisualStation.create(lat: -23.048129, lng: -43.512599, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/grumari-canto-esquerdo')
VisualStation.create(lat: -23.032061, lng: -43.472204, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/macumba-farofa-posto12')
VisualStation.create(lat: -23.031458, lng: -43.476754, url: 'https://ricosurf.com.br/boletim-das-ondas/rio-janeiro/macumba-curvao')

BuoyValue.destroy_all
BuoyStation.destroy_all

BuoyStation.create(lat: -22.971667, lng: -43.1502778)





puts "Feed cleaning statios"

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

puts "Feed beaches"

Beach.destroy_all


beach_index = 1

puts "Creating beach #{beach_index}"
file = URI.open('https://viagemdeaaz.com/wp-content/uploads/2019/02/Rio-2015-Sony-HX300-5-of-59-2-1.jpg')
beach = Beach.new(
  name: "Copacabana - Posto 5",
  lat: "-22.9806",
  lng: "-43.1888",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1

puts "Creating beach #{beach_index}"
file = URI.open('https://spguia.melhoresdestinos.com.br/system/fotos_local/fotos/45647/show/prainha.jpg')
beach = Beach.new(
  name: "Prainha - Canto Direito",
  lat: "-23.0423",
  lng: "-43.5072",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://www.google.com/maps/uv?pb=!1s0x9be823fa4ea837%3A0xd5a99b488c56480!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipN8QOIjpN8696SDerWcj2vYqpM4GY8Hgzzp9Kvf%3Dw213-h160-k-no!5smacumba%20ccb%20-%20Google%20Search!15sCgIgAQ&imagekey=!1e10!2sAF1QipN8QOIjpN8696SDerWcj2vYqpM4GY8Hgzzp9Kvf&hl=en&sa=X&ved=2ahUKEwjLlpy2pcLtAhUYH7kGHf89Bb0QoiowCnoECBkQAw#')
beach = Beach.new(
  name: "Macumba - CCB",
  lat: "-23.0316",
  lng: "-43.4761",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://www.guiaviagensbrasil.com/imagens/canto-praia-recreio-dos-bandeirantes-rj.jpg')
beach = Beach.new(
  name: "Recreio - Canto",
  lat: "-23.0299",
  lng: "-43.4673",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://i.ytimg.com/vi/HxhKqWxXbzw/maxresdefault.jpg')
beach = Beach.new(
  name: "Barra - Posto 6",
  lat: "-23.011",
  lng: "-43.3451",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://i.ytimg.com/vi/vvMRgMni2dc/maxresdefault.jpg')
beach = Beach.new(
  name: "Barra - Posto 5",
  lat: "-23.0112",
  lng: "-43.3387",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://3.bp.blogspot.com/-0i7AlTTK56I/UurFkswLxII/AAAAAAAANjs/oTOzO3VLkyI/s1600/20140120_093041.jpg')
beach = Beach.new(
  name: "Prainha",
  lat: "-23.0408",
  lng: "-43.5048",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://www.viagenspossiveis.com.br/wp-content/uploads/2016/02/Praia-da-Macumba-5.jpg')
beach = Beach.new(
  name: "Macumba - Centro",
  lat: "-23.0315",
  lng: "-43.4761",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://ateondeeupuderir.com/wp-content/uploads/2019/06/pedra-do-pontal-recreio-rj.jpg')
beach = Beach.new(
  name: "Recreio - Posto 11",
  lat: "-23.0298",
  lng: "-43.4666",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://www.viagenspossiveis.com.br/wp-content/uploads/2014/01/Praia-da-Barra-da-Tijuca-RJ.jpg')
beach = Beach.new(
  name: "Barra - Posto 4",
  lat: "-23.0123",
  lng: "-43.327",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://www.fuiserviajante.com/wp-content/uploads/2017/03/praia-do-secreto-rio-de-janeiro-8.jpg')
beach = Beach.new(
  name: "Macumba - Secreto",
  lat: "-23.0369",
  lng: "-43.4954",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://i.ytimg.com/vi/sew0A297PYM/maxresdefault.jpg')
beach = Beach.new(
  name: "Macumba - 2W",
  lat: "-23.0345",
  lng: "-43.4883",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://i.ytimg.com/vi/BFZyc8FUYCI/maxresdefault.jpg')
beach = Beach.new(
  name: "Recreio - Posto 10",
  lat: "-23.0262",
  lng: "-43.4579",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://i.ytimg.com/vi/CNQ-uKGAiAs/maxresdefault.jpg')
beach = Beach.new(
  name: "São Conrado - Canto Esquerdo",
  lat: "-22.9995",
  lng: "-43.2561",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://i.pinimg.com/originals/4e/9e/d1/4e9ed1b28ee6e31e0b5b58f9318d4e10.jpg')
beach = Beach.new(
  name: "Ipanema - Posto 8",
  lat: "-22.9881",
  lng: "-43.1971",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://4.bp.blogspot.com/-dJQzjlvs9JQ/XKgAZESqqfI/AAAAAAAAPuk/siihkOqjjHICGYEMzlVsGkKVthA4laZ9ACLcBGAs/s1600/P_20190404_084107.jpg')
beach = Beach.new(
  name: "Copacabana - Posto 6",
  lat: "-22.985",
  lng: "-43.1887",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://maladeaventuras.com/wp-content/uploads/2018/10/melhores-praias-do-rio-de-janeiro-1280x720.jpg')
beach = Beach.new(
  name: "Leblon - Canto",
  lat: "-22.9881",
  lng: "-43.2233",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://ogimg.infoglobo.com.br/in/14647326-813-77f/FT1086A/652/arpoador-2.jpg')
beach = Beach.new(
  name: "Arpoador",
  lat: "-22.9895",
  lng: "-43.1919",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=face&url=https%3A%2F%2Fcdn-image.travelandleisure.com%2Fsites%2Fdefault%2Ffiles%2F1451967729%2Fipanema-beach-rio1215.jpg')
beach = Beach.new(
  name: "Ipanema - Garcia d'avila",
  lat: "-22.9873",
  lng: "-43.2093",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://i.ytimg.com/vi/CG0dNM1fCjs/maxresdefault.jpg')
beach = Beach.new(
  name: "Diabo",
  lat: "-22.9886",
  lng: "-43.1896",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://loucosporpraia.com.br/wp-content/uploads/2014/07/leme-rio-de-janeiro-por-Bebel-Machado.jpg')
beach = Beach.new(
  name: "Leme",
  lat: "-22.9648",
  lng: "-43.1688",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://i.pinimg.com/originals/4d/c3/d9/4dc3d9f3879cbdebbcaa8a124d74c066.jpg')
beach = Beach.new(
  name: "Itacoatiara - Pampo",
  lat: "-22.9746",
  lng: "-43.0364",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://1.bp.blogspot.com/-qpipNw6kZlI/WybtJS0nmLI/AAAAAAABxrg/nYQdj997pDAcCQdAsQQxvsFqEBvcyAkMgCLcBGAs/w1200-h630-p-k-no-nu/praia-itacoatiara-niteroi.jpg')
beach = Beach.new(
  name: "Itacoatiara - Meio",
  lat: "-22.9748",
  lng: "-43.0336",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://www.viajadora.com/wp-content/uploads/2015/01/cost%C3%A3o-canto-direito-itacoatiara-niteroi-viajadora.jpg')
beach = Beach.new(
  name: "Itacoatiara - Costão",
  lat: "-22.9758",
  lng: "-43.0305",
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://www.viajali.com.br/wp-content/uploads/2019/07/praia-vermelha-08.jpg')
beach = Beach.new(
  name: "Vermelha",
  lat: -22.955250142867826,
  lng: -43.16435470679382,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://tevejopelomundo.com.br/wp-content/uploads/2017/11/praia-do-vidigal-vista-das-pedras.jpg')
beach = Beach.new(
  name: "Vidigal",
  lat: -22.99179201183994,
  lng: -43.23208173612224,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://viajento.files.wordpress.com/2019/12/aterro-do-flamengo-rio-de-janeiro-brasil.jpg')
beach = Beach.new(
  name: "Flamengo - Canto Direito",
  lat: -22.93511480093811,
  lng: -43.171060229328184,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://loucosporpraia.com.br/wp-content/uploads/2014/07/Flamengo-por-street-view02.jpg')
beach = Beach.new(
  name: "Flamengo - Centro",
  lat: -22.92859339071708,
  lng: -43.17048087215316,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://vejario.abril.com.br/wp-content/uploads/2017/10/anna-fisher4.jpg')
beach = Beach.new(
  name: "Urca",
  lat: -22.947845467099466,
  lng: -43.16344275569807,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://images.sympla.com.br/5b96bc9556e97.jpg')
beach = Beach.new(
  name: "Ribeira - Paquetá",
  lat:  -22.765827254522243,
  lng: -43.10369386790752,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://api.prond.com.br/images/resized/br-rj-niteroi/praia-do-gragoata')
beach = Beach.new(
  name: "Gragoatá",
  lat: -22.90223876167349,
  lng: -43.136141408298435,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/09/df/3d/39/praia-adao-e-eva.jpg')
beach = Beach.new(
  name: "Adão",
  lat: -22.92773303773431,
  lng: -43.12289080465795,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://ogimg.infoglobo.com.br/in/15123232-143-650/FT1086A/652/2015-780161059-2014-779560061-2014123039754.jpg_20141230.jpg_20150104.jpg')
beach = Beach.new(
  name: "Camboinhas - Centro",
  lat: -22.962056778661623,
  lng: -43.056578166471,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://curtarj.com.br/wp-content/uploads/2019/03/camboinhas-praia.jpg')
beach = Beach.new(
  name: "Camboinhas - Canto Direito",
  lat: -22.96677872425047,
  lng: -43.048402793398196,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://ladodeca.com.br/wp-content/uploads/2020/01/praia-de-charitas-por-heloisaprado-1024x543.jpg')
beach = Beach.new(
  name: "Charitas",
  lat: -22.92546025169957,
  lng: -43.09579547613986,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://www.visiteobrasil.com.br/galerias/carac4-rio-de-janeiro-praia-da-boa-viagem-niteroi/725-041534-praia-da-boa-viagem-foto-marinelsongr.jpg')
beach = Beach.new(
  name: "Boa Viagem",
  lat: -22.90804989048639,
  lng: -43.12888871521811,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://www.praias.com.br/images/stories/rj_1024/rj-niteroi-praia-das-flexas-03.jpg')
beach = Beach.new(
  name: "Flechas",
  lat: -22.90572744536363,
  lng: -43.124940503525984,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/d/dd/PraiadeIcara%C3%AD.jpg')
beach = Beach.new(
  name: "Icaraí",
  lat: -22.904749139850797,
  lng: -43.11810104477682,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/5/55/Cal%C3%A7ad%C3%A3o_de_S%C3%A3o_Francisco.jpg')
beach = Beach.new(
  name: "São Francisco",
  lat: -22.91554083836005,
  lng: -43.09586016765691,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://www.praias.com.br/images/stories/rj_1024/rj-niteroi-praia-de-jurujuba-01.jpg')
beach = Beach.new(
  name: "Jurujuba",
  lat: -22.93458055372498,
  lng: -43.11282715648674,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://ogimg.infoglobo.com.br/in/14968022-4cb-31e/FT1086A/652/2014-779562403-2014123039765.jpg_20141230.jpg')
beach = Beach.new(
  name: "Itaipu",
  lat: -22.971836357371163,
  lng: -43.046042449507574,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

beach_index += 1
puts "Creating beach #{beach_index}"
file = URI.open('https://niteroiexperience.com.br/wp-content/uploads/2020/02/60994756_2097479500552636_5859014902814867456_o.jpg')
beach = Beach.new(
  name: "Piratininga",
  lat: -22.95411333880743,
  lng: -43.09458813521258,
  overview: ["Praia mais reservada para banhistas de meia idade.", "Opção de praia para quem vai com animais de estimação.", "Praia muito frequentada por praticantes Futvolley", "Praia com mar agitado não recomendada para crianças abaixo de 12 anos"].sample
)
beach.photo.attach(io: file, filename: "#{beach_index}.jpg", content_type: 'image/jpg')
puts "Saving beach #{beach_index}"
beach.save!
puts "Beach #{beach_index} saved"

puts "Feed users and reviews"


Review.destroy_all
User.destroy_all

beaches = Beach.all

user_real = ["Tobias Ferreira", "Alice Ratton", "Vanessa Bach", "Fred Coque", "Julia Mathias", "Bernardo Neves", "Romulo Santos", "Luiz Matheus", "Glauber Lima"]


good_grade1 = {title: ["Melhor praia da vida!",
  "Praia Perfeita",
  "Vista linda e está sempre vazia",
  "Boas opções de restaurantes próximo",
  "Praia limpa e água quentinha"],
content: ["Praia vazia, calma, ondas excelentes para quem procura um surf power, e sem muitos ambulantes.",
"Vista maravilhosa, brisa da boa, recomendo passar o dia inteiro.",
"Minha família adora passar o dia inteiro nessa praia. Recomendo a visita!",
"Vou nessa praia toda a semana que tem sol. Meus filhos amam.",
"Água boa, cristalina. Muito legal!"],
grade: [4, 5, 5, 5, 5] }


good_grade2 = {title: ["Melhor praia da vida!",
  "Praia Perfeita",
  "Vista linda e está sempre vazia",
  "Boas opções de restaurantes próximo",
  "Praia limpa e água quentinha"],
content: ["Praia vazia, calma, ondas excelentes para quem procura um surf power, e sem muitos ambulantes.",
"Vista maravilhosa, brisa da boa, recomendo passar o dia inteiro.",
"Minha família adora passar o dia inteiro nessa praia. Recomendo a visita!",
"Vou nessa praia toda a semana que tem sol. Meus filhos amam.",
"Água boa, cristalina. Muito legal!"],
grade: [4, 4, 4, 5, 5] }



average_grade1 = {title: ["Muito boa, mas sempre cheia!",
  "Praia ok. Mas tem melhores",
  "Vista linda, mas a praia é lotada",
  "Bons restaurantes e só",
  "Boa opção para quem tem pouco tempo na praia"],
content: ["Praia é muito boa. Entretanto, está sempre muito cheia. Difícil achar vaga para estacionar.",
  "É uma boa praia para passar algumas horas, e só. Se tiver escolha, vá para outra praia.",
"Esta sempre muito lotada e é difícil achar um espacinho na areia. Prefira ir em dias de semana.",
"Adoro os restaurantes próximos. A comida é boa. Já a praia, não recomendo muito",
"Se você quer só dar um mergulho para refrescar, eu recomendo. Mas não dá para passar o dia inteiro nessa praia."],
grade: [3, 4, 4, 4, 4]}

average_grade2 = {title: ["Muito boa, mas sempre cheia!",
  "Praia ok. Mas tem melhores",
  "Vista linda, mas a praia é lotada",
  "Bons restaurantes e só",
  "Boa opção para quem tem pouco tempo na praia"],
content: ["Praia é muito boa. Entretanto, está sempre muito cheia. Difícil achar vaga para estacionar.",
  "É uma boa praia para passar algumas horas, e só. Se tiver escolha, vá para outra praia.",
"Esta sempre muito lotada e é difícil achar um espacinho na areia. Prefira ir em dias de semana.",
"Adoro os restaurantes próximos. A comida é boa. Já a praia, não recomendo muito",
"Se você quer só dar um mergulho para refrescar, eu recomendo. Mas não dá para passar o dia inteiro nessa praia."],
grade: [3, 4, 4, 3, 3] }


bad_grade = {title: ["Praia mais suja que já visitei!",
  "Praia lotada! Nunca mais!",
  "Muitos ambulantes e sem vaga para estacionar",
  "Comida péssima, gente por todo lugar, não recomendo!",
  "Prefira ficar em casa do que passar um dia nesse lugar"],
content: ["Praia suja, ambulante berrando no seu ouvido, lotada...nunca mais",
  "Fique em casa. Não venha para esse lugar. Muita farofa!",
  "A praia é bem mais ou menos. Mas o acesso é pessímo e nunca tem vaga para meu carro. O acesso de transporte público é impossível",
  "Não coma nada dos ambulantes. A comida é péssima e me fez muito mal. Muita gente por todo o lugar",
  "Não venha. Escolha um shopping ou uma piscina. Seu tempo será melhor aproveitado"],
grade: [3, 3, 3, 2, 3] }


user_real.each_with_index do |user, user_index|
  puts "Creating user #{user_index}"
  admin_priviledges = user_index == 0
  user_name = User.new(
    email: "#{user_index + 1}@gmail.com",
    password: '123abc',
    first_name: user.split(" ")[0],
    last_name: user.split(" ")[1],
    admin: admin_priviledges
  )
  puts "Saving user #{user_index}"
  user_name.save!
  puts "User #{user_index} saved"
  beaches.each_with_index do |beach, beach_index|
    p beach_index
    if beach_index < 8
      grade_end = good_grade1
    elsif beach_index < 17
      grade_end = good_grade2
    elsif beach_index < 27
      grade_end = average_grade1
    elsif beach_index < 34
      grade_end = average_grade2
    else
      grade_end = bad_grade
    end
    r = Review.new(
      beach_id: beach.id,
      title: grade_end[:title].sample,
      content: grade_end[:content].sample,
      parking: grade_end[:grade].sample,
      restaurant: grade_end[:grade].sample,
      public_transportation: grade_end[:grade].sample,
      security: grade_end[:grade].sample,
      cleaning: grade_end[:grade].sample,
      rent_equipment: grade_end[:grade].sample,
      wave: grade_end[:grade].sample,
      wind: grade_end[:grade].sample,
      accessibility: grade_end[:grade].sample,
      sand_strip: grade_end[:grade].sample
    )
    p grade_end[:grade].sample
    sum_all = (r.parking + r.restaurant + r.public_transportation + r.security + r.cleaning + r.rent_equipment + r.wave + r.wind + r.accessibility + r.sand_strip) / 10.0
    r.user = user_name
    p "review saved"
    r.save!
    beach.update(
      overall_parking: ((r.parking + (beach.overall_parking * (beach.reviews.size - 1))) / (beach.reviews.size)).round(3),
      overall_restaurant: ((r.restaurant + (beach.overall_restaurant * (beach.reviews.size - 1))) / (beach.reviews.size)).round(3),
      overall_public_transportation: ((r.public_transportation + (beach.overall_public_transportation * (beach.reviews.size - 1))) / (beach.reviews.size)).round(3),
      overall_security: ((r.security + (beach.overall_security * (beach.reviews.size - 1))) / (beach.reviews.size)).round(3),
      overall_cleaning: ((r.cleaning + (beach.overall_cleaning * (beach.reviews.size - 1))) / (beach.reviews.size)).round(3),
      overall_rent_equipment: ((r.rent_equipment + (beach.overall_rent_equipment * (beach.reviews.size - 1))) / (beach.reviews.size)).round(3),
      overall_wave: ((r.wave + (beach.overall_wave * (beach.reviews.size - 1))) / (beach.reviews.size)).round(3),
      overall_wind: ((r.wind + (beach.overall_wind * (beach.reviews.size - 1))) / (beach.reviews.size)).round(3),
      overall_accessibility: ((r.accessibility + (beach.overall_accessibility * (beach.reviews.size - 1))) / (beach.reviews.size)).round(3),
      overall_sand_strip: ((r.sand_strip + (beach.overall_sand_strip * (beach.reviews.size - 1))) / (beach.reviews.size)).round(3),
      overall_rating: ((sum_all + (beach.overall_rating * (beach.reviews.size - 1))) / (beach.reviews.size)).round(3)
    )
    p "ok"
  end
end


p "Scrapping and getting data inside the database"

p "Feed buoy data"

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

p "Feed visual observations data"


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

p "Feed cleaning values in the database"

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

p "Feed wave forecast values"

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

p "Feed water forecast values"

def ocean_forecast
  WaterForecastValue.destroy_all
  date1 = Time.now - 2.day
  date = Time.new(date1.year, date1.month, date1.day).strftime("%Y-%m-%d")

  # date = date.strftime("%Y-%m-%d")

  date_now = Time.new(date1.year, date1.month, date1.day, 12)



  html_file = open("https://tds.hycom.org/thredds/dodsC/GLBy0.08/expt_93.0/FMRC/runs/GLBy0.08_930_FMRC_RUN_#{date}T12:00:00Z.ascii?water_temp%5B0:1:60%5D%5B0:1:0%5D%5B1423:1:1423%5D%5B3954:1:3968%5D").read
  lines = html_file.split(/\n/)[13..-13]
  positions = WaterForecastStation.all
  WaterForecastValue.destroy_all
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

WeatherForecastValue.destroy_all
WeatherForecastDaily.destroy_all

def open_weather_api
  beaches = Beach.all
  date = Time.now
  date = Time.new(Time.now.year, Time.now.month , Time.now.day ).strftime("%Y-%m-%d")
  WeatherForecastValue.where("date_time >= '#{date}'").destroy_all
  WeatherForecastDaily.where("date_time >= '#{date}'").destroy_all
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
    water_temperature = OceanForecastValue.where("beach_id = #{beach.id} AND date_time = '#{date_time_1}'")[0]
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
