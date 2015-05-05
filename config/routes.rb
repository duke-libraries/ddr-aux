Rails.application.routes.draw do

  root to: "rails_admin/main#dashboard"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # Logout via GET
  devise_scope :user do
    get '/users/sign_out(.:format)', to: 'devise/sessions#destroy'
  end

  mount RailsAdmin::Engine => '/manage', as: 'rails_admin'

  namespace :api do
    root to: 'services#index'
    resources :admin_entities, only: [:index, :show]
  end

end
