class Comment < ApplicationRecord
  belongs_to :post
  has_many :likes, as: :likeable
  has_many :replies, as: :replyable
  validates :text, presence: true, length: { maximum: 200 }
end
