# frozen_string_literal: true
class AddReferencesToBuildings < ActiveRecord::Migration[5.0]
  def change
    add_reference :buildings, :le_user, foreign_key: true
  end
end
