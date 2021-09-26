class UserSkill < ApplicationRecord
  belongs_to :user_self_introduction
  belongs_to :skill
end
