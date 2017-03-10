# frozen_string_literal: true
class CreateFloors < ActiveRecord::Migration[5.0]
  def change
    create_table :floors do |t|
      t.string :name
      t.string :image_name
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
