class Device < ApplicationRecord
  DeviceTypes = [['场景', 0], ['灯光', 1], ['灯光+调光',2],['窗帘',3],
                  ['空调',4],['地暖',5],['新风',6]]
                  
  DefaultImages = [['all_close'],['all_open'],['amuse'],['back_home'],
                    ['bath'],['chinese_food'],['leave_home'],
                    ['meal_preparation'],['morning'],['night'],
                    ['other'],['read'],['receive'],['rest'],
                    ['study'],['video'],['wash'],['western']]

  belongs_to :area
  has_many :cams, :dependent => :destroy
  accepts_nested_attributes_for :cams
  
  validates :name, presence: true, length: { minimum: 2 }
  validates :image_name, presence: true
  validates :i_type, presence: true

  after_initialize :init
 
  private
    def init
      if self.new_record? && self.i_type.nil?
        self.i_type = 0
      end
    end

end
