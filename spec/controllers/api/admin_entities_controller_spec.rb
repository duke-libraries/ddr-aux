require "rails_helper"
require "support/shared_examples_for_api_controllers"

module Api
  RSpec.describe AdminEntitiesController, type: :controller do

    let(:body) { JSON.load(response.body) }

    describe "#show" do
      describe "authorized" do
        before do
          AdminEntity.create(slug: "foo", name: "Foo")
          controller.current_ability.can :show, AdminEntity
          get :show, id: "foo"
        end
        it_behaves_like "an API successful operation"
        it "should return the attributes" do
          expect(body["slug"]).to eq("foo")
        end
      end
      describe "not found" do
        before do
          controller.current_ability.can :show, AdminEntity
          get :show, id: "bar"
        end
        it_behaves_like "an API not found response"
      end
      describe "unauthorized" do
        before do
          AdminEntity.create(slug: "foo", name: "Foo")
          controller.current_ability.cannot :show, AdminEntity
          get :show, id: "foo"
        end
        it_behaves_like "an API forbidden operation"
      end
    end

    describe "#index" do
      before do
        FactoryGirl.create_list(:admin_entity, 3)
      end
      describe "authorized" do
        before do
          controller.current_ability.can :index, AdminEntity
          get :index
        end
        it_behaves_like "an API successful operation"
        it "should return the list" do
          expect(body.size).to eq(3)
        end
      end
      describe "unauthorized" do
        before do
          controller.current_ability.cannot :index, AdminEntity
          get :index
        end
        it_behaves_like "an API forbidden operation"
      end
    end

  end
end
