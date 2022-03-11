class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'user_id'

  validates :name, presence: true

  after_create :generate_api_token

  def recent_3_posts
    posts.order(created_at: :desc).limit(3)
  end

  def admin?(requested_role)
    role == requested_role.to_s
  end

  def generate_api_token
    self.apitoken = Devise.friendly_token
    save
  end
end
