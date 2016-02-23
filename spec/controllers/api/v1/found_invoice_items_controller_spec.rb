RSpec.describe Api::V1::FoundInvoiceItemsController, type: :controller do
  it "Returns object by id" do
    m1 = InvoiceItem.create(:unit_price => 10000)
    m2 = InvoiceItem.create(:unit_price => 20000)
    get :show, format: :json, id: m1.id

    expect(response.status).to eq 200
    expect(JSON.parse(response.body)["id"]).to eq m1.id
  end

  it "Returns object by other attribute" do
    m1 = InvoiceItem.create(:unit_price => 10000)
    m2 = InvoiceItem.create(:unit_price => 20000)
    get :show, format: :json, :unit_price => "100.0"
    expect(response.status).to eq 200
    expect(JSON.parse(response.body)["id"]).to eq m1.id
  end

  it "Returns all objects by other attribute" do
    m1 = InvoiceItem.create(:unit_price => 10000)
    m2 = InvoiceItem.create(:unit_price => 10000)
    get :index, format: :json, :unit_price => "100.0"

    expect(response.status).to eq 200
    returned_ids = JSON.parse(response.body).map{|returned| returned["id"]}
    expect(returned_ids).to eq [m1.id, m2.id]
  end

  it "Returns all objects by id" do
    m1 = InvoiceItem.create(:unit_price => 10000)
    m2 = InvoiceItem.create(:unit_price => 10000)
    get :index, format: :json, :id => m1.id

    expect(response.status).to eq 200
    returned_ids = JSON.parse(response.body).map{|returned| returned["id"]}
    expect(returned_ids).to eq [m1.id]
  end


  it "Bails if finding by non column param in show" do
    m1 = InvoiceItem.create(:unit_price => 10000)
    m2 = InvoiceItem.create(:unit_price => 20000)
    get :show, format: :json, :fame => "100.0"

    expect(response.status).to eq 200
    expect(JSON.parse(response.body)["error"]).to eq "Parameter does not exist on #{InvoiceItem}'s Table"
  end

  it "Bails if finding by non column param in index" do
    m1 = InvoiceItem.create(:unit_price => 10000)
    m2 = InvoiceItem.create(:unit_price => 20000)
    get :index, format: :json, :fame => "100.0"

    expect(response.status).to eq 200
    expect(JSON.parse(response.body)["error"]).to eq "Parameter does not exist on #{InvoiceItem}'s Table"
  end
end
