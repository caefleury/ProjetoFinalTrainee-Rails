class ProjectRole < ApplicationRecord
    validates :name, uniqueness: true
    validates :name, presence: true
    has_many :project_members, dependent: :destroy
    has_many :members, through: :project_members
end
