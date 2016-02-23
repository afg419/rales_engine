module AssociationHelper
  def get_associated(object, association_query)
    if object.respond_to?(association_query)
      respond_with object.send(association_query)
    else
      respond_with ({error: "Parameter does not exist on Merchant's Table"})
    end
  end
end
