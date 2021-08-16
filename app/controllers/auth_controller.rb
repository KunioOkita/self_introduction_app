class AuthController < ApplicationController
  skip_before_action :authenticate

  def callback
    data = request.env['omniauth.auth']
    user = User.create_from_auth_hash!(data)
    session[:graph_token_hash] = data[:credentials]
    session[:user_id] = user.id

    redirect_to root_url
  end

  def signout
    reset_session
    redirect_to root_url
  end
end
