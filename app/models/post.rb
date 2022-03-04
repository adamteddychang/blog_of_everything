class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def recent_5_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_posts_counter

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
