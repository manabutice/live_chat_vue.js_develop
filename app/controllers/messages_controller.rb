class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    messages = Message.all
    messages_array = messages.map do |message|
      {
        id: message.id,
        user_id: message.user.id,
        name: message.user.name,
        content: message.content,
        email: message.user.email,
        ## ======= 👇 ここから変更する =======
        created_at: message.created_at,
        likes: message.likes.map { |like| { id: like.id, email: like.user.email }  }
        ## ====== 👆 ここまで変更する =======
      }
    end

    render json: messages_array, status: 200
  end
end
