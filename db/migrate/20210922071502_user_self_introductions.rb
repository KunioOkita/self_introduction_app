class UserSelfIntroductions < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_self_introductions, :introduction, :string
  end
end
