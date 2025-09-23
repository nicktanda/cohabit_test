class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :species, null: false
      t.integer :gender, default: 0, null: false
      t.string :weapon
      t.string :vehicle
      t.timestamps
    end
  end
end
