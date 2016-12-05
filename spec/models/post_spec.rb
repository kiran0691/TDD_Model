require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "post links should be unique for a user" do
    user = User.create(email: "sai@gmail.com")
    user.posts.create(link: "www.google.com")
    post = user.posts.new(link: "www.google.com")
    expect(post).to have(1).errors_on(:link)
  end

  context "#short_link" do
    it "summarizes the link" do
      post= Post.new(link: "https://github.com/rspec/rspec-rails")
      expect(post.short_link).to eq("github.com")
    end
  end

  it "invalid link format" do
    post = Post.new(link: "blah blah blah")
    expect(post).to have(1).errors_on(:link)
  end

end
