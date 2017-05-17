require "ddr_aux/api/constraints"

Rails.application.routes.draw do

  root to: 'rails_admin/main#dashboard'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # Logout via GET
  devise_scope :user do
    get '/users/sign_out(.:format)', to: 'devise/sessions#destroy'
  end

  mount RailsAdmin::Engine => '/manage', as: 'rails_admin'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: DdrAux::Api::Constraints.new(version: 1, default: true) do
      scope ':model', constraints: { model: /(admin_sets|contacts|languages|licenses|rights_statements)/ } do
        get '/',    to: 'model#index'
        get 'find', to: 'model#find'
        get ':id',  to: 'model#show'
      end
      scope 'groups' do
        get '/', to: 'groups#index'
        get '/:name', to: 'groups#show'
        get '/:name/members', to: 'groups#members'
      end
      scope 'identifiers' do
        get    '/',    to: 'identifiers#index'
        post   '/',    to: 'identifiers#create'
        get    '/*id', to: 'identifiers#show'
        put    '/*id', to: 'identifiers#update'
        delete '/*id', to: 'identifiers#destroy'
      end
      get 'people/find', to: 'people#find'
      namespace :duracloud do
        get 'manifest_entries/fcrepo3', to: 'manifest_entries#fcrepo3'
      end
    end
  end

end
