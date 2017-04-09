class CreateDeviceCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :device_categories do |t|
      t.string :name
      t.integer :device_type

      t.timestamps
    end
    add_index :device_categories, :device_type, unique: true
  end
end
