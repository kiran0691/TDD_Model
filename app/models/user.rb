class User < ActiveRecord::Base
  has_many :posts
  validates :email, presence: true
  validates :email, uniqueness: true

  def self.by_letter(a)
    where("email LIKE ?"," #{a}%").order(:email)
  end

end
