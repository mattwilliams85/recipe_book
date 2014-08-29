class Recipe < ActiveRecord::Base
  validates :name, :presence => :true
  validates :content, :presence => :true
  validates :rating, :presence => :true
  has_and_belongs_to_many :tags

 def split_ingredients
    self.ingredients.split(",")
  end

def self.find_or_create

end

end
