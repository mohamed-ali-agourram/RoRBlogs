class BlogPost < ApplicationRecord
  has_rich_text :content

  validates :title, :content, presence: true

  #Model scoppes
  scope :sorted, -> { order(published_at: :desc, updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current + 3600 ) }
  scope :scheduled, -> { where("published_at >= ?", Time.current + 3600 ) }

  #record/ruby helpers
  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current + 3600
  end

  def scheduled?
    published_at? && published_at >= Time.current + 3600
  end
end
