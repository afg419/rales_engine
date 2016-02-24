require 'rails_helper'


def associate_controllers_with_models_plural_associated
  [
    {controller: Api::V1::AssociateMerchantsController,
      model: Merchant,
      associated: :items},

    {controller: Api::V1::AssociateMerchantsController,
      model: Merchant,
      associated: :invoices},

    {controller: Api::V1::AssociateItemsController,
      model: Item,
      associated: :invoice_items},

    {controller: Api::V1::AssociateCustomersController,
      model: Customer,
      associated: :invoices},

    {controller: Api::V1::AssociateInvoicesController,
      model: Invoice,
      associated: :transactions},

    {controller: Api::V1::AssociateInvoicesController,
      model: Invoice,
      associated: :invoice_items}
  ]
end


associate_controllers_with_models_plural_associated.each do |cma|
  RSpec.describe cma[:controller], type: :controller do
    it "Returns associated plural objects to model 1" do
      m = cma[:model].create
      i1 = m.send(cma[:associated]).create
      i2 = m.send(cma[:associated]).create
      get :index, format: :json, id: m.id, association: cma[:associated]

      expect(response.status).to eq 200
      relevant_reply = JSON.parse(response.body).map{|x| {"id" => x["id"]}}
      expect(relevant_reply).to eq [{"id" => i1["id"]}, {"id" => i2["id"]}]
    end

    it "Bails if not associated" do
      m = cma[:model].create
      get :index, format: :json, id: m.id, association: "FIRE"

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["error"]).to eq "Parameter does not exist on Table"
    end
  end
end