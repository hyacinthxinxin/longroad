class AddControlTypeToCamCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :cam_categories, :control_type, :integer
  end
end
