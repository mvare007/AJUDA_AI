class AddUserToChatroom < ActiveRecord::Migration[5.2]
  def change
    add_reference :chatrooms, :user, foreign_key: true
  end
end
