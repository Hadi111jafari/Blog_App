class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :like_count

  private

  def like_count
    post.increment!(:likes_counter)
  end
end
