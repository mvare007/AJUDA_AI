class CreateRequestUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :request_users do |t|
      t.references :request, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
