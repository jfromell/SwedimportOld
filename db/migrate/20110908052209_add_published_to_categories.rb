class AddPublishedToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :published, :boolean, :default => 0
  end

  def self.down
    remove_column :categories, :published
  end
end
