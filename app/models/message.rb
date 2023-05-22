class Message < ApplicationRecord
    belongs_to :user
  
  ## ======= 👇 ここから追加する =======
    validates :content, presence: true
  ## ====== 👆 ここまで追加する =======
  end
  