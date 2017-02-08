class Post < ApplicationRecord
  validates_presence_of :title, :body_textile
  validates_uniqueness_of :slug
  before_save :auto_set_slug_if_empty

  private
  def auto_set_slug_if_empty
    if self.title && !self.slug
      self.slug = title.downcase
      self.slug.gsub!(/[^\w]/, '_')
      self.slug.gsub!(/_{2,}/, '_')
      self.slug.gsub!(/(^_|_$)/, '')
    end
  end
end
