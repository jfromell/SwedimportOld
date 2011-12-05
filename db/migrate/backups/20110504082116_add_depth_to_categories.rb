class AddDepthToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :ancestry_depth, :integer, :default => 0
  end

  def self.down
    remove_column :categories, :ancestry_depth
  end
end
