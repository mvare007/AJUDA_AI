class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :asker, foreign_key: { to_table: :users }
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
