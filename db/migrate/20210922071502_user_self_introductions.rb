class UserSelfIntroductions < ActiveRecord::Migration[6.1]
  def change
    add_column :user_self_introductions, :birth_month, :integer
    add_column :user_self_introductions, :birth_day, :integer
    remove_column :user_self_introductions, :introduction, :string
  end
end
