# coding: utf-8

class UserSkillsController < ApplicationController
  def update
    pp user_skill_params
    # Delete Insert を実行
    current_user_skills = UserSkill.where(user_self_introduction_id: user_skill_params[:id])

    # 値が設定されていない場合はなにもチェックされていないので、すべて削除する
    unless user_skill_params.has_key?(:user_skills)
      current_user_skills.delete_all
      return
    end

    pp current_user_skills

    insert_user_skills = []
    delete_user_skill_ids = []
    no_change_skill_ids = []

    if current_user_skills.present?
      current_user_skills.each do |user_skill|
        if user_skill_params[:user_skills].include?(user_skill.skill_id.to_s)
          no_change_skill_ids << user_skill.skill_id
        else
          delete_user_skill_ids << user_skill.skill_id
        end
      end
    end

    user_skill_params[:user_skills].each do |skill_id|
      now_time = Time.current
      unless no_change_skill_ids.include?(skill_id.to_i)
        insert_user_skills << {
          user_self_introduction_id: user_skill_params[:id],
          skill_id: skill_id.to_i,
          created_at: now_time,
          updated_at: now_time
        }
      end
    end

    # 削除
    if delete_user_skill_ids.present?
      UserSkill
        .where(user_self_introduction_id: user_skill_params[:id], skill_id: delete_user_skill_ids)
        .delete_all
    end
    # 追加
    UserSkill.insert_all(insert_user_skills) if insert_user_skills.present?
  end

  def user_skill_params
    params.permit(:id, user_skills: [])
  end
end
