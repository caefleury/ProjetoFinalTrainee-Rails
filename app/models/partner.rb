class Partner < ApplicationRecord
    validates :name, uniqueness: true
end
