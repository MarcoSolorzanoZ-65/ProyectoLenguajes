require 'rails_helper'

RSpec.describe Order, type: :model do
  subject {
    described_class.new(order_status: 1)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an order status" do
    subject.order_status = nil
    expect(subject).to_not be_valid
  end

  it "has many products" do
    product1 = Product.create(name: "Product 1", desc: "Description 1", price: 10.99)
    product2 = Product.create(name: "Product 2", desc: "Description 2", price: 20.99)
    subject.products << product1
    subject.products << product2
    expect(subject.products).to include(product1, product2)
  end
end


