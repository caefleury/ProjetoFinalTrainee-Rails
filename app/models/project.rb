class Project < ApplicationRecord
    validates :name, :description, presence: true
    validates :name, uniqueness: true
    has_many :project_members, dependent: :destroy
    has_many :project_services, dependent: :destroy
end
