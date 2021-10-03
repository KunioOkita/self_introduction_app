# coding: utf-8

class UserSelfIntroductionsController < ApplicationController
  skip_before_action :authenticate, only: [:show]

  def show
    @user_self_introduction = UserSelfIntroduction.preload(:skills).preload(skills: :skill_category).find(params[:id])
  end

  def new
    @user_self_introduction = UserSelfIntroduction.new
  end

  def create
    @user_self_introduction = UserSelfIntroduction.new(user_self_introduction_params)
    @user_self_introduction.user_id = current_user.id

    if @user_self_introduction.save
      redirect_to @user_self_introduction
    end
  end

  def edit
    @user_self_introduction = UserSelfIntroduction.preload(:skills).find(params[:id])
    @skills = Skill.order(:skill_category_id).order(:id).preload(:skill_category).all
    @skills_map = {}
    @skills.each do |skill|
      @skills_map[skill.skill_category.name] = [] unless @skills_map.key?(skill.skill_category.name)
      @skills_map[skill.skill_category.name].append(skill)
    end

    @current_user_skill_ids = @user_self_introduction.skills.map(&:id)
    pp @current_user_skill_ids
  end

  def update
    @user_self_introduction = UserSelfIntroduction.find(params[:id])
    if @user_self_introduction.update(user_self_introduction_params)
      redirect_to @user_self_introduction, notice: "更新しました"
    end
  end

  private
    def user_self_introduction_params
      params
        .require(:user_self_introduction)
        .permit(:birth_place, :hobby, :introduction, :self_image, :remove_self_image, :birth_month, :birth_day, :joining_date)
    end
end
