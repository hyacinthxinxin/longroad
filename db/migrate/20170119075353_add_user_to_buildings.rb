# frozen_string_literal: true
class AddUserToBuildings < ActiveRecord::Migration[5.0]
  def change
    add_reference :buildings, :user, foreign_key: true
  end
end
