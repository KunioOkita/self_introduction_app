class UserSelfIntroduction < ApplicationRecord
  has_one_attached :self_image
  has_one :user_division
  has_one :division, through: :user_division
  belongs_to :user

  attr_accessor :remove_self_image

  before_save :remove_self_image_if_user_accept


  def created_by?(user)
    return false unless user
    user_id == user.id
  end

  private

  def remove_self_image_if_user_accept
    self.self_image = nil if ActiveRecord::Type::Boolean.new.cast(remove_self_image)
  end
end
