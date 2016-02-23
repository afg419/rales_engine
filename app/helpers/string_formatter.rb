module StringFormatter

  def capitalize_all(string)
    string.split.map do |word|
      word.capitalize
    end.join(" ")
  end

end
