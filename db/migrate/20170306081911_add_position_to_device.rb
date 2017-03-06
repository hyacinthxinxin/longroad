class AddPositionToDevice < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :position, :integer
    Device.order(:updated_at).each.with_index(1) do |device, index|
      device.update_column :position, index
    end
  end
end
