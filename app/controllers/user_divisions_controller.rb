# coding: utf-8

class UserDivisionsController < ApplicationController
  def update
    puts "user_division_params => #{user_division_params}"
    user_division = UserDivision.find_or_initialize_by(id: user_division_params[:division_id])
    puts "user_division => #{user_division}"
    user_division.update(
      user_self_introduction_id: user_division_params[:id],
      division_id: user_division_params[:division_id]
    )
  end

  def user_division_params
    params.permit(:id, :division_id)
  end
end
