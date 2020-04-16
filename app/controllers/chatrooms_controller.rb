class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.includes(messages: :user).all
  end

  def show
    @chatroom = Chatroom.includes(messages: :user).find(params[:id])
  end

  def destroy
    @chatroom = Chatroom.includes(messages: :user).find(params[:id]).destroy
  end
end
