class Item < ActiveRecord::Base
  belongs_to :merchant

  before_save :insert_slug

  def insert_slug
    self.slug = name.parameterize
  end

end
