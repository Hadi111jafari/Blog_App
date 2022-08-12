class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :post_count

  private

  def post_count
    author.increment!(:posts_counter)
  end

  def last_5_comments
    comments.order(created_at: :desc).limit(5)
  end
end
