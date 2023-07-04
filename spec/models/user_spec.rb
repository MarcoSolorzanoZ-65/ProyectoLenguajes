require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      email: "user@example.com",
      password: "password",
      category: category,
      address: "123 Main St" # Agrega la dirección aquí
    )
  }

  let(:category) { Category.create(category_name: "Category 1") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "belongs to a category" do
    expect(subject.category).to eq(category)
  end
end



