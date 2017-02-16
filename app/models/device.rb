class Device < ApplicationRecord
  DeviceTypes = [['场景', 0], ['灯光', 1], ['灯光+调光',2],['窗帘',3],['空调',4],['地暖',5],['新风',6]]
  DefaultImages = [['all_close'], ['all_open'], ['amuse']]

  belongs_to :area
  has_many :cams, :dependent => :destroy
  validates :name, presence: true, length: { minimum: 2 }
  validates :image_name, presence: true
  validates :i_type, presence: true
end
