require 'rails_helper'

RSpec.describe Category, type: :model do
  subject {
    described_class.new(
      category_name: "Category 1"
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a category name" do
    subject.category_name = nil
    expect(subject).to_not be_valid
  end
end


