FactoryBot.define do

  factory :lead do
    name { Faker::Name.name}
    description { Faker::Lorem.sentence(word_count: 10) }
    status { 'todo' }
  end

end
