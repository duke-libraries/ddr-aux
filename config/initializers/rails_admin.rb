RailsAdmin.config do |config|

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with :cancan, RailsAdmin::Ability

  config.excluded_models = %w( Duracloud::ManifestEntry Duracloud::AuditLogEntry Duracloud::BitIntegrityCheck )

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

  config.model 'Language' do
    list do
      sort_by :code
      field :code do
        sort_reverse false
      end
      field :label
    end
    update do
      configure :code do
        read_only true
      end
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

  config.model 'RightsStatement' do
    list do
      field :title
      field :url
      field :short_title
      field :reuse_text
    end
    update do
      configure :url do
        read_only true
      end
    end
  end

  # config.model 'Duracloud::ManifestEntry' do
  #   list do
  #     field :space_id
  #     field :content_id do
  #       label do
  #         "Content ID"
  #       end
  #     end
  #   end
  # end

  # config.model 'Duracloud::AuditLogEntry' do
  #   list do
  #     field :store_id
  #     field :space_id
  #     field :content_id do
  #       label do
  #         "Content ID"
  #       end
  #     end
  #     field :timestamp
  #     field :action
  #   end
  # end

  # config.model 'Duracloud::BitIntegrityCheck' do
  #   list do
  #     field :date_checked
  #     field :store_type
  #     field :space_id
  #     field :content_id do
  #       label do
  #         "Content ID"
  #       end
  #     end
  #     field :result
  #   end
  # end

end
