require 'rails_helper'

def found_controllers_with_models_attributes
  [
    {controller: Api::V1::FoundMerchantsController,
      model: Merchant,
      attribute: :name},

    {controller: Api::V1::FoundItemsController,
      model: Item,
      attribute: :name},

    {controller: Api::V1::FoundCustomersController,
      model: Customer,
      attribute: :first_name},

    {controller: Api::V1::FoundTransactionsController,
      model: Transaction,
      attribute: :result},

    {controller: Api::V1::FoundInvoicesController,
      model: Invoice,
      attribute: :status}
  ]
end


found_controllers_with_models_attributes.each do |cma|
  RSpec.describe cma[:controller], type: :controller do
    it "Returns object by id" do
      m1 = cma[:model].create(cma[:attribute] => "#{cma[:model]}1")
      m2 = cma[:model].create(cma[:attribute] => "#{cma[:model]}2")
      get :show, format: :json, id: m1.id

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["id"]).to eq m1.id
    end

    it "Returns object by other attribute" do
      m1 = cma[:model].create(cma[:attribute] => "#{cma[:model]}1")
      m2 = cma[:model].create(cma[:attribute] => "#{cma[:model]}2")
      get :show, format: :json, cma[:attribute] => "#{cma[:model]}1"
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["id"]).to eq m1.id
    end

    it "Returns all objects by other attribute" do
      m1 = cma[:model].create(cma[:attribute] => "#{cma[:model]}1")
      m2 = cma[:model].create(cma[:attribute] => "#{cma[:model]}1")
      get :index, format: :json, cma[:attribute] => "#{cma[:model]}1"

      expect(response.status).to eq 200
      returned_ids = JSON.parse(response.body).map{|returned| returned["id"]}
      expect(returned_ids).to eq [m1.id, m2.id]
    end

    it "Returns all objects by id" do
      m1 = cma[:model].create(cma[:attribute] => "#{cma[:model]}1")
      m2 = cma[:model].create(cma[:attribute] => "#{cma[:model]}1")
      get :index, format: :json, :id => m1.id

      expect(response.status).to eq 200
      returned_ids = JSON.parse(response.body).map{|returned| returned["id"]}
      expect(returned_ids).to eq [m1.id]
    end

    it "Returns object by other attribute multi-cased multi-worded" do
      m1 = cma[:model].create(cma[:attribute] => "#{cma[:model]} One")
      m2 = cma[:model].create(cma[:attribute] => "#{cma[:model]}")
      get :show, format: :json, cma[:attribute] => "#{cma[:model]} One"

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["id"]).to eq m1.id
    end

    it "Bails if finding by non column param in show" do
      m1 = cma[:model].create(cma[:attribute] => "#{cma[:model]} One")
      m2 = cma[:model].create(cma[:attribute] => "#{cma[:model]}")
      get :show, format: :json, :fame => "#{cma[:model]} One"

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["error"]).to eq "Parameter does not exist on #{cma[:model]}'s Table"
    end

    it "Bails if finding by non column param in index" do
      m1 = cma[:model].create(cma[:attribute] => "#{cma[:model]} One")
      m2 = cma[:model].create(cma[:attribute] => "#{cma[:model]}")
      get :index, format: :json, :fame => "#{cma[:model]} One"

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["error"]).to eq "Parameter does not exist on #{cma[:model]}'s Table"
    end
  end
end
