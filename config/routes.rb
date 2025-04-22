Rails.application.routes.draw do
  # Root route
  root to: 'home#index'

  # Devise routes for user authentication
  devise_for :users

  # Mount RailsAdmin for admin dashboard (accessible only to admin users)
  authenticate :user, ->(user) { user.admin? } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  # API routes
  namespace :api do
    namespace :v1 do
      # Categories API: Only index action is available
      resources :categories, only: [:index]

      # Authors API: Only show action is available
      resources :authors, only: [:show]

      # Articles API: Index and show actions are available
      resources :articles, only: [:index, :show]
    end
  end

  # Redirect invalid paths to the root path
  match '*path', to: 'home#index', via: :all
end
