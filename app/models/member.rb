class Member < ApplicationRecord
  belongs_to :role
  has_many :project_roles, dependent: :destroy
end
