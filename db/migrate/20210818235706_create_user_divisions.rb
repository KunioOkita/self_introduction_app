class CreateUserDivisions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_divisions do |t|
      t.references :user_self_introduction, null: false, foreign_key: true
      t.references :division, null: false, foreign_key: true

      t.timestamps
    end
  end
end
