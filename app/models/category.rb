class Category < ApplicationRecord
    has_many :users
    validates :category_name, presence: true
end
