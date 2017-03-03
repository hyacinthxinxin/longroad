class Floor < ApplicationRecord
  belongs_to :building
  has_many :areas, dependent: :destroy
  acts_as_list scope: :building
  
  validates :name, presence: true, length: { minimum: 2 }

end
