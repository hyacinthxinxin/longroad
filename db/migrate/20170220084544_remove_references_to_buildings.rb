class RemoveReferencesToBuildings < ActiveRecord::Migration[5.0]
  def change
    remove_reference :buildings, :user, index: true, foreign_key: true
  end
end
