class Merchant < ActiveRecord::Base
  # def name
    # name.split.map{|x| x.downcase}
  # end

  before_save :insert_slug

  def insert_slug
    self.slug = name.parameterize
  end
end
