require "rails_helper"

module Api::V1
  module Duracloud
    RSpec.describe ManifestEntriesController do

      describe "required params" do
        it "requires 'content_id'" do
          expect { get :index, space_id: 'foo' }.to raise_error(ActionController::ParameterMissing)
        end
        it "requires 'space_id'" do
          expect { get :index, content_id: 'foo' }.to raise_error(ActionController::ParameterMissing)
        end
        specify {
          expect { get :index, space_id: 'foo', content_id: 'bar' }.not_to raise_error
        }
      end

    end
  end
end
