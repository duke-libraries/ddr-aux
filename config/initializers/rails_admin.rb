RailsAdmin.config do |config|

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with :cancan, RailsAdmin::Ability

  config.actions do
    dashboard
    index # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  config.model 'User' do
    list do
      field :username
      field :display_name
      field :email
      field :admin
    end
    show do
      field :admin
      field :username
      field :display_name
      field :email
      field :last_name
      field :first_name
      field :nickname
    end
    edit do
      field :admin
      field :username
      field :display_name
      field :email
      field :last_name
      field :first_name
      field :nickname
    end
    visible do
      bindings[:controller].current_user.admin?
    end
  end

  config.model 'Contact' do
    list do
      field :slug
      field :name
      field :url
    end
  end

  config.model 'License' do
    list do
      field :title
      field :url
    end
    show do
      configure :terms do
        formatted_value do
          value ? value.html_safe : value
        end
      end
    end
    update do
      configure :url do
        read_only true
      end
    end
  end

end
