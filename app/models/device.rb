class Device < ApplicationRecord
  DeviceTypes = [['场景', 0], ['灯光', 1], ['灯光+调光',2],['窗帘',3],
                  ['空调', 4],['地暖', 5],['新风', 6]]
                  
  DefaultImages = [['all_close'],['all_open'],['amuse'],['back_home'],
                    ['bath'],['chinese_food'],['leave_home'],
                    ['meal_preparation'],['morning'],['night'],
                    ['other'],['read'],['receive'],['rest'],
                    ['study'],['video'],['wash'],['western']]
  
  DeviceTypesName = [['场景', 0], ['灯光', 1], ['灯光+调光',2],['窗帘',3], ['空调', 4],['地暖', 5],['新风', 6]]

  belongs_to :area
  acts_as_list scope: :area
  has_many :cams, -> { order("position ASC") }, dependent: :destroy, inverse_of: :device
  accepts_nested_attributes_for :cams, allow_destroy: true, reject_if: :all_blank

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

  amoeba do
    enable
    prepend :name => "Copy of "
  end
  
end
