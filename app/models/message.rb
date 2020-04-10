class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  after_create :broadcast_message

  validates :content, presence: true, allow_blank: false, length: { maximum: 200 }

  def from?(some_user)
    user == some_user
  end

  def broadcast_message
    ActionCable.server.broadcast("chatroom_#{chatroom.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "messages/message",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: user.id
    })
  end
end
