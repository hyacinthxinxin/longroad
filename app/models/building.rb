class Building < ApplicationRecord
      belongs_to :user
      has_many :floors, dependent: :destroy
      validates :name, presence: true, length: { minimum: 2 }
end
