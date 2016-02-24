class Api::V1::Associations::TransactionsController < Api::V1::Associations::BaseController
  respond_to :json

  def index
    get_associated(Transaction.find(params[:id]), params[:association])
  end
end
