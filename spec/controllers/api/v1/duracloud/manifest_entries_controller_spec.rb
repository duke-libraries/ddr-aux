require "rails_helper"

module Api::V1
  module Duracloud
    RSpec.describe ManifestEntriesController do

      describe "required params" do
        it "requires 'object_uri'" do
          expect { get :fcrepo3, space_id: 'foo' }.to raise_error(ActionController::ParameterMissing)
        end
        it "requires 'space_id'" do
          expect { get :fcrepo3, object_uri: 'info:fedora/duke:1' }.to raise_error(ActionController::ParameterMissing)
        end
        specify {
          expect { get :fcrepo3, space_id: 'foo', object_uri: 'info:fedora/duke:1' }.not_to raise_error
        }
      end

    end
  end
end
