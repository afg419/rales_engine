module FoundService
  def find_all(class_name, finder_params)
    if class_name.first.attributes.include?(finder_params.keys.first)
      respond_with class_name.where(finder_params)
    else
      respond_with ({error: "Parameter does not exist on #{class_name}'s Table"})
    end
  end

  def find_first(class_name, finder_params)
    if class_name.first.attributes.include?(finder_params.keys.first)
      respond_with class_name.find_by(finder_params)
    else
      respond_with ({error: "Parameter does not exist on #{class_name}'s Table"})
    end
  end
end
