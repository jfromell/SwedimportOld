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
  
  define_index do
    
    # fields
    indexes :name, :sortable => true
    indexes description
    indexes products.name, :as => :products_name
    indexes names_depth_cache, :as => :associated
    
    set_property :enable_star => 1
    set_property :min_infix_len => 1
  end
  
end
