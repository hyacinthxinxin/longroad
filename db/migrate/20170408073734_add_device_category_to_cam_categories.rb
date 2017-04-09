class AddDeviceCategoryToCamCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :cam_categories, :device_category, foreign_key: true
  end
end
