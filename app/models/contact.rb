class Contact < ApplicationRecord
  validates :name, :email, :telephone, :description, :budget, :date, presence: true
  validates :email, :telephone, uniqueness: true
  has_many :contact_services, dependent: :destroy
  has_many :services, through: :contact_services
end
