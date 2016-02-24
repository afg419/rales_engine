require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def controllers_model(folder)
    {
      "api/v1/#{folder}/customers" => Customer,
      "api/v1/#{folder}/items" => Item,
      "api/v1/#{folder}/merchants" => Merchant,
      "api/v1/#{folder}/invoices" => Invoice,
      "api/v1/#{folder}/transactions" => Transaction,
      "api/v1/#{folder}/invoice_items" => InvoiceItem
    }
  end
end
