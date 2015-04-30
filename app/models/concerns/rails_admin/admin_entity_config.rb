module RailsAdmin
  module AdminEntityConfig
    extend ActiveSupport::Concern

    included do
      rails_admin do
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
          field :ask
        end
      end
    end

  end
end
