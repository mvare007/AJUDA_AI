class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.references :assignment, foreign_key: true
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
