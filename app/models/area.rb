class Area < ApplicationRecord
  DefaultAreaImages = [['bar-counter'],['chess-cards'],['children'],['conference'],['dining'],
                        ['guest-rest'],['hallway'],['kitchen'],['living'],['main-bath'],['main-bed'],
                        ['old'],['other'],['reading'],['study'],['the-porch'],['video'],['winter-garden']]

  belongs_to :floor
  acts_as_list scope: :floor

  has_many :devices, -> { order("position ASC") }, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
  validates :image_name, presence: true
  

end