# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" },{ name: "Lord of the Rings" }])
#   Character.create(name: "Luke",movie: movies.irst)
# car brands to seed db

brands = ['ACADIAN', 'ACURA', 'ALFA ROMEO', 'AMERICAN MOTORS', 'ARO',
          'ASIA MOTORS', 'ASTON MARTIN', 'AUDI', 'AUSTIN', 'AUTORRAD', 'BAIC',
          'BEIGING', 'BENTLEY', 'BMW', 'BRILLIANCE', 'BUICK', 'BYD', 'CADILLAC',
          'CATERHAM', 'CHANGAN', 'CHANGHE', 'CHERY', 'CHEVROLET', 'CHRYSLER',
          'CITROEN', 'COMMER', 'DACIA', 'DAEWOO', 'DAIHATSU', 'DATSUN', 'DFSK',
          'DODGE', 'DONGFENG', 'DS AUTOMOBILES', 'F.S.O.', 'FAW', 'FERRARI',
          'FIAT', 'FORD', 'FOTON', 'FREIGHTLINER', 'G.M.C.', 'GAC GONOW',
          'GEELY', 'GREAT WALL', 'HAFEI', 'HAIMA', 'HAVAL', 'HILLMAN', 'HONDA',
          'HYUNDAI', 'INFINITI', 'INTERNATIONAL', 'ISUZU', 'IVECO', 'JAC',
          'JAGUAR', 'JEEP', 'JINBEI', 'JMC', 'KARMA', 'KENBO', 'KIA MOTORS',
          'LADA', 'LAMBORGHINI', 'LANCIA', 'LAND ROVER', 'LANDWIND', 'LEXUS',
          'LIFAN', 'LINCOLN', 'LOTUS', 'MAHINDRA', 'MASERATI', 'MAXUS', 'MAZDA',
          'MCLAREN', 'MERCEDES BENZ', 'MERCURY', 'MG', 'MINI', 'MITSUBISHI',
          'MORGAN', 'MORRIS', 'NISSAN', 'NSU', 'OLDSMOBILE', 'OPEL', 'PEUGEOT',
          'PLYMOUTH', 'POLSKI FIAT', 'PONTIAC', 'SUZUKI', 'TATA', 'TOYOTA',
          'VOLKSWAGEN', 'VOLVO', 'WILLYS', 'YUGO', 'ZASTAVA', 'ZNA', 'ZOTYE',
          'ZX']

brands.each do |brand|
  Brand.find_or_create_by(name: brand.downcase)
end
