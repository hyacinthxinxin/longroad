# frozen_string_literal: true
class Floor < ApplicationRecord
  belongs_to :building
  acts_as_list scope: :building

  has_many :areas, -> { order('position ASC') }, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }

  amoeba do
    enable
  end
end
