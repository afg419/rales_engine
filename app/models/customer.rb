class Customer < ActiveRecord::Base

  before_save :insert_slug

  def insert_slug
    self.slug = (first_name + " " + last_name).parameterize
  end
end
