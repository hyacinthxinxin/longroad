class Cam < ApplicationRecord
  first_address_block = /\d{,1}|1[0-5]/
  second_address_block = /[0-7]/
  third_address_block = /\d{,2}|1\d{2}|2[0-4]\d|25[0-5]/
  VALID_ADDRESS_REGEX = /\A#{first_address_block}\/#{second_address_block}\/#{third_address_block}\z/

  belongs_to :device
  validates :name, presence: true, length: { minimum: 2 }
  validates :control_address, presence: true, format: { with: VALID_ADDRESS_REGEX }
  validates :status_address, presence: true, format: { with: VALID_ADDRESS_REGEX }

  default_scope -> { order(i_type: :asc) }

  after_initialize :init
  def init
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