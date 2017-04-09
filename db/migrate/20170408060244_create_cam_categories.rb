class CreateCamCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :cam_categories do |t|
      t.string :name
      t.integer :cam_type

      t.timestamps
    end
  end
end
