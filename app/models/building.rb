class Building < ApplicationRecord
      has_many :floors, dependent: :destroy
      validates :name, presence: true, length: { minimum: 2 }
end
