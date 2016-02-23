module AssociationHelper
  def get_associated(object, association_query, serializer)
    if object.respond_to?(association_query)
      # respond_with only_ids_of(object.send(association_query))
      respond_with object.send(association_query)
      # render json: object.send(association_query), each_serializer: AssociatedToMerchantSerializer
    else
      respond_with ({error: "Parameter does not exist on Table"})
    end
  end

  # def only_ids_of(json)
  #   if json.respond_to?(:count)
  #     json.map {|x| {id: x.id}}
  #   else
  #     {id: json.id}
  #   end
  # end
end
