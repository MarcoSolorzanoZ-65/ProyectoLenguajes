require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      email: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
  }

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

  it "is not valid if password and password_confirmation don't match" do
    subject.password_confirmation = "different_password"
    expect(subject).to_not be_valid
  end
end

