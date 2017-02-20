class RemoveLeUser < ActiveRecord::Migration[5.0]
  def change
    remove_reference :buildings, :le_user, index: true, foreign_key: true
    drop_table :le_users
    add_reference :buildings, :user, foreign_key: true
  end
end
