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

# expect(user.errors[:name].first).to include("is too long")
# はuser.errors[:name].firstに"is too long"が含まれているかどうかを評価している
# include メソッドは、配列に使うか、文字列に使うかで評価方法が異なる

# 配列⇨完全一致でtrue
# 文字列⇨完全に一致しなくても、含まれていればtrue

# なのでexpect(user.errors[:name]).to include("is too long")
# だと、"is too long"は
# user.errors[:name]の配列に向けてincludeしていて
# 配列（error文）と完全一致しないのでerrorになってしまった
# 。firstをつけることにより
# 配列の中身の１番目を取り出し、文字列のerror文と評価することにより
# 完全一致でなくなり、一部一致になるのでうまくいった！

# errorが出た時は、まず自分で定義したuser = User.new/create
# で自分の求めるインスタンスが作られているのかを確認してから
# なぜexpectとマッチャがうまく行かないのかを考える！









