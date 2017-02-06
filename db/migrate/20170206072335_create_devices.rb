class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :image_name
      t.integer :i_type
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
