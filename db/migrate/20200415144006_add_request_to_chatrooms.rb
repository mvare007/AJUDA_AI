class AddRequestToChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :chatrooms, :request, foreign_key: true
  end
end
