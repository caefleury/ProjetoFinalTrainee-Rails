class Service < ApplicationRecord
    validates :name, uniqueness: true
    has_many :project_services, dependent: :destroy
    has_many :contacts, dependent: :destroy
end
