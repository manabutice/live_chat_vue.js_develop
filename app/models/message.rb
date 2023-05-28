class Message < ApplicationRecord
  belongs_to :user
  ## ======= 👇 ここから追加する =======
  has_many :likes
  ## ====== 👆 ここまで追加する =======

  validates :content, presence: true
end