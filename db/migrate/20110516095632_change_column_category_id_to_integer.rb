class ChangeColumnCategoryIdToInteger < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.change :category_id, :integer
    end
  end

  def self.down
    change_table :products do |t|
      t.change :category_id, :varchar
    end
  end
end
