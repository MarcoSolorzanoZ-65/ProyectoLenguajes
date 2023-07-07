class Product < ApplicationRecord
  belongs_to :menu
  has_one_attached :image

  validates :name, presence: true
  validates :desc, presence: true
  validates :price, presence: true

  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
end