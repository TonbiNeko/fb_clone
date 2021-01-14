require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, password, password_digest" do
    user = User.new(
      name: 'test',
      email: 'testtest@example.com',
      password: 'umeboshi',
      password_digest: 'umeboshi')
    expect(user).to be_valid
  end
  it "is invalid without name" do
    user = User.new(name: nil,
    email: 'testtest@example.com',
    password: 'umeboshi',
    password_digest: 'umeboshi')
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  it "is invalid with a dublicate email" do
    User.create(
      name: 'test_ume',
      email: 'test_ume@example.com',
      password: 'umeboshi',
      password_digest: 'umeboshi')
      user = User.new(
        name: 'test_ume2',
        email: 'test_ume@example.com',
        password: 'umeboshi',
        password_digest: 'umeboshi')
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
  end
  it "is invalid with name is 31 or more characters" do
    user = User.new(
      name: 't' * 31,
      email: 'test_ume@example.com',
      password: 'umeboshi',
      password_digest: 'umeboshi')
      user.valid?
      expect(user.errors[:name].first).to include("is too long")
  end
end









