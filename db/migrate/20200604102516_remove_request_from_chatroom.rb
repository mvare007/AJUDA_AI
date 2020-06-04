class RemoveRequestFromChatroom < ActiveRecord::Migration[5.2]
  def change
    remove_reference :chatrooms, :request, foreign_key: true
  end
end
