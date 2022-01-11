# coding: utf-8
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user = User.find(params[:id])
    # 画像削除
    @user.user_self_introduction.self_image.purge
    # 自己紹介情報削除
    @user.user_self_introduction.destroy
    # ユーザ情報削除
    @user.destroy

    redirect_to action: :index
  end
end
