# coding: utf-8

class UserDivisionsController < ApplicationController
  def update
    user_division = UserDivision.find_or_initialize_by(user_self_introduction_id: user_division_params[:id])
    user_division.update(
      user_self_introduction_id: user_division_params[:id],
      division_id: user_division_params[:division_id]
    )
  end

  def user_division_params
    params.permit(:id, :division_id)
  end
end
