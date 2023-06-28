require 'rails_helper'

RSpec.describe Menu, type: :model do
  subject {
    described_class.new(name: "Menu principal")
  }

  let(:product1) { Product.create(name: "Producto 1", desc: "Descripción 1", price: 10.99, status: true) }
  let(:product2) { Product.create(name: "Producto 2", desc: "Descripción 2", price: 20.99, status: false) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end






