class AuthController < ApplicationController
  skip_before_action :set_user

  def callback
    data = request.env['omniauth.auth']
    save_in_session(data)
    User.create_from_auth_hash!(data)

    redirect_to root_url
  end

  def signout
    reset_session
    redirect_to root_url
  end
end
