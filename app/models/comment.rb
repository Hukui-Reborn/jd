class Comment < ApplicationRecord
  validates :content, presence:{message: "请写入留言"}
  belongs_to :user
  belongs_to :product


  scope :recent, -> { order("created_at DESC")}
end
