class CreateCams < ActiveRecord::Migration[5.0]
  def change
    create_table :cams do |t|
      t.string :name
      t.string :image_name
      t.integer :i_type
      t.integer :control_type
      t.string :control_address
      t.string :status_address
      t.integer :control_value
      t.integer :status_value
      t.integer :min_control_value
      t.integer :max_control_value
      t.integer :min_status_value
      t.integer :max_status_value
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
