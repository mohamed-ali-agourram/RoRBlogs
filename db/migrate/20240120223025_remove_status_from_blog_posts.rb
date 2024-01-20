class RemoveStatusFromBlogPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :blog_posts, :status, :string
  end
end
