class Product < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :menu

  validates :name, presence: true
  validates :desc, presence: true
  validates :price, presence: true
end

  
