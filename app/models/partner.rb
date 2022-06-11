class Partner < ApplicationRecord
    validates :name, :link, uniqueness: true
    validates :name, :link, presence: true
end
