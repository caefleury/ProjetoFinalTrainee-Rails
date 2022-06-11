class ProjectRole < ApplicationRecord
    validates :name, uniqueness: true
    validates :name, presence: true
    has_many :project_members, dependent: :destroy
end
