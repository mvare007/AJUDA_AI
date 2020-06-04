class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.includes(messages: :user).all
  end

  def create
    @user = User.find(params[:id])
    @chatroom = Chatroom.new(name: @user.full_name, user: @user)
    redirect_to chatroom_path(@chatroom) if @chatroom.save
  end

  def show
    @chatroom = Chatroom.includes(messages: :user).find(params[:id])
    @chatrooms = Chatroom.includes(messages: :user).all
  end

  def destroy
    @chatroom = Chatroom.includes(messages: :user).find(params[:id]).destroy
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end
end
