class AddPositionToArea < ActiveRecord::Migration[5.0]
  def change
    add_column :areas, :position, :integer
    Area.order(:updated_at).each.with_index(1) do |area, index|
      area.update_column :position, index
    end
  end
end
