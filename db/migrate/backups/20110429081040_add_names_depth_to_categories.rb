class AddNamesDepthToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :names_depth_cache, :string
  end

  def self.down
    remove_column :categories, :names_depth_cache
  end
end
