class Floor < ApplicationRecord
  belongs_to :building
  acts_as_list scope: :building

  has_many :areas, -> { order("position ASC") }, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }

end
