class Order < ApplicationRecord
    has_many :products
    validates :order_status, presence: true
end
