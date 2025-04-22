FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word } # Generate a random name for the category
  end
end