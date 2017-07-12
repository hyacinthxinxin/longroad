# frozen_string_literal: true
class Building < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true

  has_many :floors, -> { order('position ASC') }, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }

  validates :socket_address, presence: true
  # , format: { with: Regexp.new(/((25[0-5]|2[0-4]\d|1\d\d|[1-9]\d|\d)\.){3}(25[0-5]|2[0-4]\d|1\d\d|[1-9]\d|\d)/) }

  before_save :default_values
  def default_values
    self.socket_port ||= 4196
  end

  amoeba do
    enable
  end

  rails_admin do
    configure :user do
      label 'Owner of this building: '
    end
  end

end
