Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/manage', as: 'rails_admin'

  resources :admin_entities, only: :index, defaults: { format: "json" } do
    collection do
      get 'slugs(.:format)', action: "slugs", defaults: { format: "json" }
      get ':slug(.:format)', action: "slug", defaults: { format: "json" }
    end
  end

end
