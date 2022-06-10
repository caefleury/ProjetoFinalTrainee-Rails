class Role < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    has_many :members, dependent: :destroy
end
