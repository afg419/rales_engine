module RandomHelper

  def random(class_name)
    class_name.all.shuffle.first
  end

end
