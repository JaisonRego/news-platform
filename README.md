# News Platform

A Ruby on Rails application for managing and publishing news articles with features like user authentication, admin dashboard, and API endpoints.

---

## Table of Contents

- [Requirements](#requirements)
- [Setup Instructions](#setup-instructions)
- [Features](#features)
- [Environment Variables](#environment-variables)
- [Database Setup](#database-setup)
- [Running the Application](#running-the-application)
- [Testing](#testing)
- [Deployment](#deployment)
- [API Endpoints](#api-endpoints)
- [Contributing](#contributing)
- [License](#license)

---

## Requirements

- **Ruby version**: 3.2.2
- **Rails version**: ~> 7.1.0
- **Database**: MySQL (`mysql2` gem)
- **Web Server**: Puma
- **Other dependencies**: See the [Gemfile](./Gemfile) for a complete list of dependencies.

---

## Setup Instructions

1. Clone the repository:  
   `git clone git@github.com:JaisonRego/news-platform.git && cd news-platform`

2. Install the required gems:  
   `bundle install`

3. Create a `.env` file in the root directory and add the following variables:

```
ADMIN_EMAIL=admin@example.com
ADMIN_PASSWORD=password
```

4. Set up the database:  
   `rails db:create && rails db:migrate && rails db:seed`

---

## Features

- **User Authentication**: Powered by Devise.
- **Admin Dashboard**: Manage users, articles, categories, and tags using RailsAdmin.
- **API Endpoints**: Expose RESTful APIs for articles, categories, and authors.
- **Pagination**: Efficient pagination using Kaminari.
- **Data Generation**: Use Faker for generating seed data.
- **Responsive Design**: Asset pipeline with SassC for styling.

---

## Environment Variables

The application uses the `dotenv-rails` gem to manage environment variables. Add the following variables to your `.env` file:

```
ADMIN_EMAIL=admin@example.com
ADMIN_PASSWORD=password
```

---

## Database Setup

1. Create the database: `rails db:create`
2. Run migrations: `rails db:migrate`
3. Seed the database with initial data: `rails db:seed`

---

## Running the Application

Visit the application at:

- **Frontend**: [http://localhost:3000](http://localhost:3000)
- **Admin Dashboard**: [http://localhost:3000/admin](http://localhost:3000/admin)

---

## Testing

Run the test suite:  
`rails test`

---

## Deployment

1. Precompile assets: `rails assets:precompile`
2. Deploy to your preferred hosting platform (e.g., Heroku, AWS, etc.)

---

## API Endpoints

- **Base URL**: [http://localhost:3000/api/v1](http://localhost:3000/api/v1)

### Categories

- `GET /categories`: Fetch all categories.

### Authors

- `GET /authors/:id`: Fetch a specific author by ID.

### Articles

- `GET /articles`: Fetch all articles with optional filters.
- `GET /articles/:id`: Fetch a specific article by ID.

---

## Contributing

1. Fork the repository.
2. Create a new branch: `git checkout -b feature-name`
3. Commit your changes: `git commit -m "Add feature-name"`
4. Push to the branch: `git push origin feature-name`
5. Open a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
