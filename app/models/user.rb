class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :messages

## ======= 👇 ここから追加する =======
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
## ====== 👆 ここまで追加する =======
end
