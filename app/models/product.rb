class Product < ApplicationRecord
    validates :name, presence: true
    validates :desc, presence: true
    validates :price, presence: true

    belongs_to :menu
    has_one_attached :image
  end
  
