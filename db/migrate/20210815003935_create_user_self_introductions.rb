class CreateUserSelfIntroductions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_self_introductions do |t|
      t.string :birth_place
      t.string :hobby
      t.string :introduction
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
