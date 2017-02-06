class Cam < ApplicationRecord
  belongs_to :device, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
end
