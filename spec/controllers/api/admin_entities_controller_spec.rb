require "rails_helper"
require "support/shared_examples_for_api_controllers"
require "support/shared_examples_for_api_model_controllers"

module Api
  RSpec.describe AdminEntitiesController, type: :controller do
    it_behaves_like "an API model controller"
  end
end
