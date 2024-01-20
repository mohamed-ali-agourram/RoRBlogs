require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  let(:draft_post) { create(:blog_post, published_at: nil) }
  let(:published_post) { create(:blog_post, published_at: Time.current) }
  let(:scheduled_post) { create(:blog_post, published_at: Time.current + 3600) }

  describe "draft" do
    it "returns all blog posts that have not been published" do
      expect(BlogPost.draft).to eq([draft_post])
    end
  end

  describe "published" do
    it "returns all blog posts that have been published" do
      expect(BlogPost.published).to eq([published_post])
    end
  end

  describe "scheduled" do
    it "returns all blog posts that are scheduled" do
      expect(BlogPost.scheduled).to eq([scheduled_post])
    end
  end
end
