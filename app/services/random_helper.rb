module RandomHelper

  def show
    render json: random(controllers_model[params[:controller]])
  end

private

  def random(class_name)
    class_name.all.shuffle.first
  end

  def controllers_model
    {
      "api/v1/random_customers" => Customer,
      "api/v1/random_items" => Item,
      "api/v1/random_merchants" => Merchant
    }
  end
end
