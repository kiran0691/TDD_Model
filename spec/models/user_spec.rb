require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"


  it "is invalid without an email" do
    expect(User.new(email: nil)).to have_exactly(1).errors_on(:email)
  end

  it "duplicate emails are invalid" do
    User.create(email: "sai@gmail.com")
    user = User.new(email: "sai@gmail.com")
    expect(user).to have_at_least(1).errors_on(:email)
  end

  context ".by_letter" do
    it "returns a sorted array of emails that start with that particular letter " do
      sai = User.create(email: "sai@gmail.com")
      sumanth = User.create(email: "sumanth@gmail.com")
      vamsi = User.create(email: "vamsi@gmail.com")
      expect(User.by_letter('s')).to eq [sai, sumanth]
    end
  end

end
