class Floor < ApplicationRecord
  belongs_to :building
  has_many :areas, dependent: :destroy
  
  validates :name, presence: true, length: { minimum: 2 }

end
