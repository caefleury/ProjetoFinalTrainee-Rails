class Service < ApplicationRecord
    validates :name, uniqueness: true
    validates :name, presence: true
    has_many :project_services, dependent: :destroy
    has_many :contact_services, dependent: :destroy
    has_many :contact, through: :contact_services
end
