class Recipe < ActiveRecord::Base
  validates :name, :presence => :true
  validates :content, :presence => :true
  validates :rating, :presence => :true
  validates :date, :presence => :true
end
