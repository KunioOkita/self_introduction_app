class Division < ApplicationRecord
  has_many :user_divisions
  has_many :user_self_introductions, through: :user_divisions
  belongs_to :department
end
