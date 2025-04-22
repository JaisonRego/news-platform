FactoryBot.define do
  factory :author do
    name { Faker::Name.name }              # Generate a random name for the author
    description { Faker::Lorem.paragraph } # Generate a random paragraph for the author's description
  end
end