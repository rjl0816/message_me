class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user_id = 2
    if message.save
      redirect_to root_path
    end
  end


  private

  def message_params
    params.require(:message).permit(
      :body,
      :user_id
    )
  end

end
