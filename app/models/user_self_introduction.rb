class UserSelfIntroduction < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :self_image
  has_one :user_division, dependent: :destroy
  has_one :division, through: :user_division
  has_many :user_skills, -> { order('skill_id ASC') }, dependent: :destroy
  has_many :skills, through: :user_skills
  belongs_to :user
  has_rich_text :introduction

  attr_accessor :remove_self_image

  before_save :remove_self_image_if_user_accept

  def created_by?(user)
    return false unless user
    user_id == user.id
  end

  def base_uri
    user_self_introduction_path(self)
  end

  private
    def remove_self_image_if_user_accept
      self.self_image = nil if ActiveRecord::Type::Boolean.new.cast(remove_self_image)
    end
end
