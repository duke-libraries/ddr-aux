RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan, RailsAdmin::Ability

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  # config.excluded_models << "User"

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show
  end

  ## Model config

  config.model "AdminEntity" do
    list do
      field :id
      field :slug
      field :name
      field :short_name
    end
    edit do
      field :slug do
        visible do
          bindings[:object].slug.blank?
        end
        help "Required. Must be unique. Not changeable after creation."
      end
      field :name
      field :short_name
      field :phone
      field :email
      field :url
    end
  end # AdminEntity

  config.model "User" do
    visible do
      bindings[:controller].current_user.admin?
    end
  end

end
