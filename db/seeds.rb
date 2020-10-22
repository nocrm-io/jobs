# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

100.times do
  date = Faker::Time.between(from: 6.month.ago.at_beginning_of_month, to: Time.now)
  Lead.create(name: Faker::FunnyName.name, description: "email: #{Faker::Internet.email}", status: Lead::STATUSES.sample, amount: Faker::Number.number(digits: 2)*100, probability: (0..100).to_a.sample, created_at: date, updated_at: date)
end