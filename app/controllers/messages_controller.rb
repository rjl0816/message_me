class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user_id = 2
    if message.save
      ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(message)
    end
  end


  private

  def message_params
    params.require(:message).permit(
      :body,
      :user_id
    )
  end

  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end

end
