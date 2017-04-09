class AddIndexToCamCategories < ActiveRecord::Migration[5.0]
  def change
    add_index :cam_categories, :cam_type, unique: true
  end
end
