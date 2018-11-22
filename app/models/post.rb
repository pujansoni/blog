class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable
  has_many :comments, dependent: :destroy
  has_many :replies, as: :replyable
  validates :message, presence: true, length: { maximum: 200 }
end
