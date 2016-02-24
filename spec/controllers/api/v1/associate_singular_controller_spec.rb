associate_controllers_with_models_singular_associated.each do |cma|
  RSpec.describe cma[:controller], type: :controller do
    it "Returns associated plural objects to model 1" do
      new_model = cma[:associated_model].create
      m = cma[:model].create(cma[:associated_id] => new_model.id )

      get :index, format: :json, id: m.id, association: cma[:associated]

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["id"]).to eq new_model.id
    end

    it "Bails if not associated" do
      new_model = cma[:associated_model].create
      m = cma[:model].create(cma[:associated_id] => new_model.id )

      get :index, format: :json, id: m.id, association: "FIRE"

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["error"]).to eq "Parameter does not exist on Table"
    end
  end
end
