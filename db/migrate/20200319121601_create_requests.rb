class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :category, null: false
      t.string :person_name, null: false
      t.integer :age
      t.text :address, null: false
      t.string :zip_code, null: false
      t.string :city, null: false
      t.string :phone_number
      t.boolean :completed, default:false
      t.references :user, foreign_key: true
      t.references :volunteer, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
