class AddSortListToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :sortList, :string, :default => '[0,0]'
  end

  def self.down
    remove_column :categories, :sortList
  end
end
