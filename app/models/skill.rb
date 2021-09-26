class Skill < ApplicationRecord
  has_many :user_skills
  has_many :user_self_introductions, through: :user_skills
  belongs_to :skill_category
end
