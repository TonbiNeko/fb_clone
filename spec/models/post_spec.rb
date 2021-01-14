require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is invalid without title" do
    post = Post.new(title: nil)
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end
end











