class Floor < ApplicationRecord
  belongs_to :building
  has_many :areas, dependent: :destroy
end
