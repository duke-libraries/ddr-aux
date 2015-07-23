RSpec.shared_examples "an API model controller" do

  let(:body) { JSON.load(response.body) }
  let(:resource_name) { controller.send(:resource_name) }
  let(:factory_name) { resource_name.to_sym }
  let(:resource_class) { controller.send(:resource_class) }

  describe "#show" do
    describe "authorized" do
      let(:obj) { FactoryGirl.create(factory_name) }
      before do
        controller.current_ability.can :show, resource_class
        get :show, id: obj, format: "jsonld"
      end
      it_behaves_like "an API successful operation"
      it_behaves_like "a JSON-LD API operation"
      it "should have a JSON-LD context" do
        expect(JSON.parse(response.body)["@context"]).to be_present
      end
      it "should have a JSON-LD identifier" do
        expect(JSON.parse(response.body)["@id"]).to be_present
      end
    end
    describe "not found" do
      before do
        controller.current_ability.can :show, resource_class
        get :show, id: "foobar", format: "jsonld"
      end
      it_behaves_like "an API not found response"
    end
    describe "unauthorized" do
      before do
        obj = FactoryGirl.create(factory_name)
        controller.current_ability.cannot :show, resource_class
        get :show, id: obj, format: "jsonld"
      end
      it_behaves_like "an API forbidden operation"
    end
  end

  describe "#index" do
    before do
      FactoryGirl.create_list(factory_name, 3)
    end
    describe "authorized" do
      before do
        controller.current_ability.can :index, resource_class
        get :index, format: "jsonld"
      end
      it_behaves_like "an API successful operation"
      it_behaves_like "a JSON-LD API operation"
      it "should return the list" do
        expect(body.size).to eq(3)
      end
    end
    describe "unauthorized" do
      before do
        controller.current_ability.cannot :index, resource_class
        get :index, format: "jsonld"
      end
      it_behaves_like "an API forbidden operation"
    end
  end

end
