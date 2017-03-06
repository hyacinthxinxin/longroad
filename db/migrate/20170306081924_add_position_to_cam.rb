class AddPositionToCam < ActiveRecord::Migration[5.0]
  def change
    add_column :cams, :position, :integer
    Cam.order(:updated_at).each.with_index(1) do |cam, index|
      cam.update_column :position, index
    end
  end
end
