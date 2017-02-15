class Cam < ApplicationRecord
  belongs_to :device, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }

  before_save :default_values
  def default_values
    self.control_address ||= '0/0/0'
    self.status_address ||= '0/0/0'
    self.control_value ||= 0
    self.status_value ||= 0
    self.min_control_value ||= 0
    self.max_control_value ||= 0
    self.min_status_value ||= 0
    self.max_status_value ||= 0
  end
  
end