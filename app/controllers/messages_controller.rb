class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
     @chatroom = Chatroom.find(params[:chatroom_id])
     @message = Message.new(message_params)
     @message.chatroom = @chatroom
     @message.user = current_user
     if @message.save
      respond_to do |format|
       format.html {redirect_to chatroom_path(@chatroom)}
       format.js
      end
     else
      respond_to do |format|
       format.html {render "chatrooms/show"}
       format.js
      end
     end
   end

   private

  def message_params
    params.require(:message).permit(:content)
  end
end
