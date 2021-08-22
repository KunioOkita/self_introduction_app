class TopController < ApplicationController
  skip_before_action :authenticate

  def index
    @user_self_introductions = UserSelfIntroduction.all
  end
end
