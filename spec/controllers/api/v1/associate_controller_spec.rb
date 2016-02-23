require 'rails_helper'

associate_controllers_with_models_plural_associated.each do |cma|
  RSpec.describe cma[:controller], type: :controller do
    it "Returns associated plural objects to model 1" do
      m = cma[:model].create
      i1 = m.send(cma[:associated1]).create
      i2 = m.send(cma[:associated1]).create
      get :index, format: :json, id: m.id, association: cma[:associated1]

      expect(response.status).to eq 200
      relevant_reply = JSON.parse(response.body).map{|x| {"id" => x["id"]}}
      expect(relevant_reply).to eq [{"id" => i1["id"]}, {"id" => i2["id"]}]

      # expect(JSON.parse(response.body)).to eq [{"id" => i1.id}, {"id" => i2.id}]
    end

    it "Returns associated plural objects to model 2" do
      m = cma[:model].create
      i1 = m.send(cma[:associated2]).create
      i2 = m.send(cma[:associated2]).create
      get :index, format: :json, id: m.id, association: cma[:associated2]

      expect(response.status).to eq 200
      relevant_reply = JSON.parse(response.body).map{|x| {"id" => x["id"]}}
      expect(relevant_reply).to eq [{"id" => i1["id"]}, {"id" => i2["id"]}]

      # expect(JSON.parse(response.body)).to eq [{"id" => i1.id}, {"id" => i2.id}]
    end


    it "Bails if not associated" do
      m = cma[:model].create
      get :index, format: :json, id: m.id, association: "FIRE"

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["error"]).to eq "Parameter does not exist on Table"
    end
  end
end
