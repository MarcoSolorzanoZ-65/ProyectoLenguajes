require 'rails_helper'

RSpec.describe Product, type: :model do
  subject {
    described_class.new(
      name: "Product 1",
      desc: "Description of Product 1",
      price: 10.99,
      menu: menu,
      order: order
    )
  }

  let(:menu) { Menu.create(name: "Menu principal") }
  let(:order) { Order.create(order_status: 1) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.desc = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it "belongs to a menu" do
    expect(subject.menu).to eq(menu)
  end

  it "belongs to an order" do
    expect(subject.order).to eq(order)
  end
end










