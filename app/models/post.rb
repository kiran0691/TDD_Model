class Post < ActiveRecord::Base
  belongs_to :user
  validates :link, uniqueness: {scope: :user_id}
  validate :link_format

  def short_link
    URI.parse(link).host
  end

  def link_format
    unless valid_link?
      errors.add(:link, "invalid link format")
    end
  end

  def valid_link?
    begin
      !!URI.parse(link)
    rescue URI::InvalidURIError
      false
    end
  end
end
