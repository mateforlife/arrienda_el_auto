# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" },{ name: "Lord of the Rings" }])
#   Character.create(name: "Luke",movie: movies.irst)
# car brands to seed db

# Car brands and models
brands_with_models = JSON.parse(File.read('db/car_brands_and_models.json'))
brands_with_models.each do |brand|
  brand_name = brand['brand']
  b = Brand.find_or_create_by(name: brand_name.downcase.titleize)
  next if b.nil?

  models = brand['models']
  models.each do |model|
    VehicleModel.find_or_create_by(name: model.downcase.titleize, brand_id: b.id)
  end
end

# Fees
if Fee.count.zero?
  Fee.find_or_create_by(body_type: 'citycar', engine_type: 'diesel', amount: 17142)
  Fee.find_or_create_by(body_type: 'citycar', engine_type: 'gasoline', amount: 14285)
  Fee.find_or_create_by(body_type: 'sedan', engine_type: 'diesel', amount: 18571)
  Fee.find_or_create_by(body_type: 'sedan', engine_type: 'gasoline', amount: 15714)
end

# States and Cities
JSON.parse(File.read('db/chilean_cities.json')).each do |city|
  state = State.find_or_create_by(name: city['region'])
  city['comunas'].each do |comuna|
    City.find_or_create_by(name: comuna, state_id: state.id)
  end
end

# Banks
JSON.parse(File.read('db/chilean_banks.json')).each do |bank|
  Bank.find_or_create_by(name: bank['name'])
end
