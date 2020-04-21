class AddVolunteerToAssignment < ActiveRecord::Migration[5.2]
  def change
    add_reference :assignments, :volunteer, foreign_key: true

  end
end
