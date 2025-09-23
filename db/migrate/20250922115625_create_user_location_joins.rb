class CreateUserLocationJoins < ActiveRecord::Migration[8.0]
  def change
    create_table :user_location_joins do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.timestamps
    end
  end
end
