# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Lead.create(name: 'Acme Corp', description: 'email: john.doe@acme.corp', status: 'todo', amount: 1000, probability: 50)
Lead.create(name: 'The World company', description: 'email: steve.doe@twc.corp', status: 'todo', amount: 500, probability: 25)
Lead.create(name: "You Don't Need a CRM", description: 'email: mrawesome@youdontneedacrm.com', status: 'lost', amount: 1000, probability: 0)
Lead.create(name: 'Poire', description: 'email: stephane.travail@poire.fr', status: 'won', amount: 6000, probability: 100)