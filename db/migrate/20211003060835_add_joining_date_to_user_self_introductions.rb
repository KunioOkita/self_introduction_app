class AddJoiningDateToUserSelfIntroductions < ActiveRecord::Migration[6.1]
  def change
    add_column :user_self_introductions, :joining_date, :date
  end
end
