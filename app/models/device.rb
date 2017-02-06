class Device < ApplicationRecord
  belongs_to :area
  has_many :cams, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
end
