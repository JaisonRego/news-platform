FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence(word_count: 3) }  # Generate a random title with 3 words
    article_type { "text" }                         # Default article type
    publish_date { Faker::Date.backward(days: 30) } # Random publish date within the last 30 days
    category                                        # Association with the category factory
    author                                          # Association with the author factory
    user                                            # Automatically create an associated user
  end
end