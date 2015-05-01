Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/manage', as: 'rails_admin'

  resources :admin_entities, only: [:index, :show], defaults: { format: "json" } do
    collection do
      get 'slugs'
    end
  end

end
