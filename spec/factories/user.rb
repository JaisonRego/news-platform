FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }           # Generate a random email
    password { "password" }                   # Default password
    password_confirmation { "password" }      # Confirm the password
    role { "user" }                           # Default role is "user"
  end
end