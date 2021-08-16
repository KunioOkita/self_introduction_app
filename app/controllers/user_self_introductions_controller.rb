class UserSelfIntroductionsController < ApplicationController
  def show
    @user_self_introduction = UserSelfIntroduction.find(params[:id])
  end

  def new
    @user_self_introduction = UserSelfIntroduction.new
  end

  def create
    @user_self_introduction =  UserSelfIntroduction.new(event_params)
    @user_self_introduction.user_id = current_user.id

    if @user_self_introduction.save
      redirect_to @user_self_introduction
    end
  end

  private

  def event_params
    params.require(:user_self_introduction).permit(:birth_place, :hobby, :introduction)
  end
end
