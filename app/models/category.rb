class Category < ActiveRecord::Base
  # For nesting categories
  has_ancestry :orphan_strategy => :destroy, :cache_depth => true
  has_many :products, :dependent => :destroy
  
  # For carrierweb association
  has_many :photos, :dependent => :destroy
  
  # Validation
  validates :name, :presence => true
  validates :description, :presence => true
  
  # Pretty dropdowns
  before_save :cache_ancestry
  
  def cache_ancestry
    self.names_depth_cache = path.map(&:name).join('/')
  end
  
end
