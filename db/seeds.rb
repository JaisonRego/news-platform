# This file seeds the database with initial data for development and testing purposes.
# It ensures the existence of records required to run the application in every environment.
# The code here is idempotent, meaning it can be executed multiple times without creating duplicate records.

# Create Admin User
User.create!(
  email: ENV.fetch("ADMIN_EMAIL"),                    # Admin email from environment or default
  password: ENV.fetch("ADMIN_PASSWORD"),              # Admin password from environment or default
  password_confirmation: ENV.fetch("ADMIN_PASSWORD"), # Confirm password
  role: :admin                                        # Set role as admin
)

# Create Categories
10.times do
  Category.create!(
    name: Faker::Lorem.word # Generate random category names
  )
end
puts "Created 10 Categories"

# Create Authors
5.times do
  Author.create!(
    name: Faker::Name.name,         # Generate random author names
    image: Faker::Avatar.image,     # Generate random image URLs
    description: Faker::Lorem.paragraph # Random description for authors
  )
end
puts "Created 5 Authors"

# Create Tags
15.times do
  Tag.create!(
    name: Faker::Lorem.word # Generate random tag names
  )
end
puts "Created 15 Tags"

# Create Articles
20.times do
  article = Article.create!(
    title: Faker::Lorem.sentence(word_count: 3),          # Generate random article titles
    sub_title: Faker::Lorem.sentence(word_count: 5),      # Generate random subtitles
    article_image: Faker::Avatar.image,                  # Random article image URL
    article_type: ["text", "audio", "video"].sample,      # Random article type
    description: Faker::Lorem.paragraphs(number: 3).join("\n\n"), # Random description (HTML snippet)
    media_url: Faker::Internet.url,                      # Random media URL (for audio/video)
    category: Category.order("RAND()").first,          # Random category
    author: Author.order("RAND()").first,              # Random author
    publish_date: Faker::Date.backward(days: 30)         # Random publish date within the last 30 days
  )

  # Assign random tags to the article
  article.tags = Tag.order("RAND()").limit(3) # Assign up to 3 random tags

  puts "Created Article: #{article.title}"
end
puts "Created 20 Articles"
