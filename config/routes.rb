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
      scope ':model', constraints: { model: /(admin_sets|contacts|licenses)/ } do
        get '/',    to: 'model#index'
        get 'find', to: 'model#find'
        get ':id',  to: 'model#show'
      end
      get 'groups', to: 'groups#index'
      scope 'identifiers' do
        get    '/',    to: 'identifiers#index'
        post   '/',    to: 'identifiers#create'
        get    '/*id', to: 'identifiers#show'
        put    '/*id', to: 'identifiers#update'
        delete '/*id', to: 'identifiers#destroy'
      end
      get 'people/find', to: 'people#find'
    end
  end

end
