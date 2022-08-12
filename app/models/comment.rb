class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :comment_count

  private

  def comment_count
    post.increment!(:comments_counter)
  end
end
