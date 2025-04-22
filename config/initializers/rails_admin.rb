RailsAdmin.config do |config|
  config.asset_source = :sprockets
  # Authentication setup
  # Ensures only authenticated users can access the Rails Admin dashboard.
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  # Model configuration for 'User'
  config.model 'User' do
    edit do
      field :email
      field :password
      field :password_confirmation
      field :role, :enum do
        enum do
          User.roles.keys # This will provide the available roles
        end
      end
      field :reset_password_token
      field :reset_password_sent_at
      field :remember_created_at
    end
  end

  # Model configuration for 'Article'
  config.model 'Article' do
    edit do
      # Fields to be displayed and edited in the admin panel
      field :title
      field :sub_title
      field :article_image
      field :article_type, :enum do
        # Enum field for article types
        enum { Article.article_types.keys }
      end
      field :description, :text
      field :media_url
      field :publish_date
      field :category
      field :author
      field :tags
    end
  end

  # Model configuration for 'Category'
  config.model 'Category' do
    edit do
      # Fields to be displayed and edited in the admin panel
      field :name
    end
  end
end
