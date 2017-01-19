class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :image_name
      t.string :socket_address
      t.integer :socket_port

      t.timestamps
    end

  end
end
