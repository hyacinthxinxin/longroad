# frozen_string_literal: true
class AddPositionToFloor < ActiveRecord::Migration[5.0]
  def change
    add_column :floors, :position, :integer
    Floor.order(:updated_at).each.with_index(1) do |floor, index|
      floor.update_column :position, index
    end
  end
end
