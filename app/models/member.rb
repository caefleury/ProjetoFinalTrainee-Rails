class Member < ApplicationRecord
  belongs_to :role
  validates :name, presence: true
  has_many :project_members, dependent: :destroy
end
