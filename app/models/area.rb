class Area < ApplicationRecord
  belongs_to :floor
  has_many :devices, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
end
