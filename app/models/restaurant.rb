class Restaurant < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :name, presence: true, uniqueness: true
end
