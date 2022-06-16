class Project < ApplicationRecord
    validates :name, :description, :link, presence: true
    validates :name, :link, uniqueness: true
    has_many :project_members, dependent: :destroy
    has_many :project_services, dependent: :destroy
    has_many :members, through: :project_members

    has_one_attached :photo
end
