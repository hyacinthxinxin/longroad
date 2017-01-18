class Building < ApplicationRecord
      has_many: floors
      validates :name, presence: true, length: { minimum: 2 }
end
