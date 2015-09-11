require "ddr_aux/api_constraints"

Rails.application.routes.draw do

  root to: 'rails_admin/main#dashboard'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # Logout via GET
  devise_scope :user do
    get '/users/sign_out(.:format)', to: 'devise/sessions#destroy'
  end

  mount RailsAdmin::Engine => '/manage', as: 'rails_admin'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: DdrAux::ApiConstraints.new(version: 1, default: true) do
      resources :licenses, only: [:index, :show] do
        get 'find', on: :collection
      end
    end
  end

end
