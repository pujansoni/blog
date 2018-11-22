class Reply < ApplicationRecord
  belongs_to :replyable, polymorphic: true
  validates :message, presence: true, length: { maximum: 200 }
end
