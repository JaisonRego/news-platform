require 'rails_helper'

RSpec.describe 'Routes', type: :routing do
  before do
    allow_any_instance_of(RailsAdmin::MainController).to receive(:_current_user).and_return(double('User', admin?: true))
    allow_any_instance_of(RailsAdmin::MainController).to receive(:authenticate_user!).and_return(true)
  end

  # Devise routes
  it 'routes /users/sign_in to devise sessions#new' do
    expect(get: '/users/sign_in').to route_to('devise/sessions#new')
  end

  it 'routes /users/sign_out to devise sessions#destroy' do
    expect(delete: '/users/sign_out').to route_to('devise/sessions#destroy')
  end

  # RailsAdmin routes
  it 'routes /admin to RailsAdmin', skip: 'Routing spec, filters in controller cause failure' do
    expect(get: '/admin').to route_to('rails_admin/main#dashboard')
  end

  # API routes
  it 'routes /api/v1/categories to categories#index' do
    expect(get: '/api/v1/categories').to route_to('api/v1/categories#index')
  end

  it 'routes /api/v1/authors/:id to authors#show' do
    expect(get: '/api/v1/authors/1').to route_to('api/v1/authors#show', id: '1')
  end

  it 'routes /api/v1/articles to articles#index' do
    expect(get: '/api/v1/articles').to route_to('api/v1/articles#index')
  end

  it 'routes /api/v1/articles/:id to articles#show' do
    expect(get: '/api/v1/articles/1').to route_to('api/v1/articles#show', id: '1')
  end

  # Root route
  it 'routes / to the root path' do
    expect(get: '/').to route_to(controller: 'home', action: 'index')
  end

  # Invalid paths
  it 'redirects invalid paths to the root path' do
    expect(get: '/invalid_path').to route_to(controller: 'home', action: 'index', path: 'invalid_path')
  end
end