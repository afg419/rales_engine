def associate_controllers_with_models_singular_associated
  [
    {controller: Api::V1::AssociateItemsController,
      model: Item,
      associated_model: Merchant,
      associated_id: :merchant_id,
      associated: :merchant},

    {controller: Api::V1::AssociateInvoicesController,
      model: Invoice,
      associated_model: Customer,
      associated_id: :customer_id,
      associated: :customer},

    {controller: Api::V1::AssociateInvoicesController,
      model: Invoice,
      associated_model: Merchant,
      associated_id: :merchant_id,
      associated: :merchant},

    {controller: Api::V1::AssociateInvoiceItemsController,
      model: InvoiceItem,
      associated_model: Item,
      associated_id: :item_id,
      associated: :item},

    {controller: Api::V1::AssociateInvoiceItemsController,
      model: InvoiceItem,
      associated_model: Invoice,
      associated_id: :invoice_id,
      associated: :invoice},

    {controller: Api::V1::AssociateTransactionsController,
      model: Transaction,
      associated_model: Invoice,
      associated_id: :invoice_id,
      associated: :invoice}
  ]
end


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
