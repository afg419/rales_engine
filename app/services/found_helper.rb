module FoundHelper
  def find_all(class_name, finder_params)
    if class_name.first.attributes.include?(finder_params.keys.first)
      case_insensitive_where(class_name, finder_params)
    else
      respond_with ({error: "Parameter does not exist on #{class_name}'s Table"})
    end
  end

  def find_first(class_name, finder_params)
    if class_name.first.attributes.include?(finder_params.keys.first)
      case_insensitive_find_by(class_name, finder_params)
    else
      respond_with ({error: "Parameter does not exist on #{class_name}'s Table"})
    end
  end

  def case_insensitive_where(class_name, finder_params)
    key = finder_params.keys.first
    if ["name", "first_name", "last_name"].include?(key)
      respond_with class_name.where("LOWER(#{key}) = ?", finder_params[key].downcase)
    else
      respond_with class_name.where(finder_params)
    end
  end

  def case_insensitive_find_by(class_name, finder_params)
    key = finder_params.keys.first
    if ["name", "first_name", "last_name"].include?(key)
      respond_with class_name.find_by("LOWER(#{key}) = ?", finder_params[key].downcase)
    else
      respond_with class_name.find_by(finder_params)
    end
  end
end
