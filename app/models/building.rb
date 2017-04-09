# frozen_string_literal: true
require 'ipaddress'
class Building < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true

  has_many :floors, -> { order('position ASC') }, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }

  validates :socket_address, presence: true, format: { with: Resolv::IPv4::Regex }

  before_save :default_values
  def default_values
    self.socket_port ||= 4196
  end

  amoeba do
    enable
  end
end
