require "open-uri" # needed for URI.open

# Create Admin User
User.create!(
  email: ENV.fetch("ADMIN_EMAIL"),
  password: ENV.fetch("ADMIN_PASSWORD"),
  password_confirmation: ENV.fetch("ADMIN_PASSWORD"),
  role: :admin
)

# Create Categories
10.times do
  Category.create!(
    name: Faker::Lorem.word
  )
end
puts "Created 10 Categories"

# Create Authors
5.times do
  Author.create!(
    name: Faker::Name.name,
    image: Faker::Avatar.image,
    description: Faker::Lorem.paragraph
  )
end
puts "Created 5 Authors"

# Create Tags
15.times do
  Tag.create!(
    name: Faker::Lorem.word
  )
end
puts "Created 15 Tags"

# Create Articles
20.times do
  article = Article.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    sub_title: Faker::Lorem.sentence(word_count: 5),
    article_type: ["text", "audio", "video"].sample,
    description: Faker::Lorem.paragraphs(number: 3).join("\n\n"),
    media_url: Faker::Internet.url,
    category: Category.order("RAND()").first,
    author: Author.order("RAND()").first,
    publish_date: Faker::Date.backward(days: 30)
  )

  # Attach random image to article_image using Lorem Picsum
  image_url = "https://picsum.photos/600/400?random=#{rand(1..1000)}"
  file = URI.open(image_url)
  article.article_image.attach(io: file, filename: "article_#{article.id}.jpg", content_type: "image/jpeg")

  # Assign up to 3 random tags
  article.tags = Tag.order("RAND()").limit(3)

  puts "Created Article: #{article.title}"
end

puts "Created 20 Articles with random attached images"
