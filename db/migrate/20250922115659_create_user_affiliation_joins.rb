class CreateUserAffiliationJoins < ActiveRecord::Migration[8.0]
  def change
    create_table :user_affiliation_joins do |t|
      t.references :user, null: false, foreign_key: true
      t.references :affiliation, null: false, foreign_key: true
      t.timestamps
    end
  end
end
