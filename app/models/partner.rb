class Partner < ApplicationRecord
    validates :name, :link, uniqueness: true
    validates :name, :link, presence: true

    has_one_attached :photo
end
