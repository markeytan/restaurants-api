class Restaurant < ApplicationRecord
    has_many :comments
    validates :name, presence: true, uniqueness: true
end
