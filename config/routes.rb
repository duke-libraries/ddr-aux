Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/manage', as: 'rails_admin'
  get '/admin_entities/:slug(.:format)', to: 'admin_entities#show'
end
