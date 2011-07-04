class Product < ActiveRecord::Base
  
  belongs_to :category
  
  validates :name, :presence => true
  validates :measures, :presence => true
  validates :category_id, :presence => true

end
