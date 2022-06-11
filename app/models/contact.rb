class Contact < ApplicationRecord
  belongs_to :service
  validates :name, :email, :telephone, :description, :budget, presence: true
  validates :email, :telephone, uniqueness: true
  has_many :contact_services, dependent: :destroy
  has_many :services, through: :contact_services
end
