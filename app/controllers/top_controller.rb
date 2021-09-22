class TopController < ApplicationController
  skip_before_action :authenticate

  def index
    @user_self_introductions = UserSelfIntroduction.with_attached_self_image.order(updated_at: :desc).all
  end
end
