# coding: utf-8

require "microsoft_graph_auth"
require "oauth2"

class ApplicationController < ActionController::Base
  before_action :authenticate
  helper_method :logged_in?, :current_user

  def refresh_tokens(token_hash)
    oauth_strategy = OmniAuth::Strategies::MicrosoftGraphAuth.new(
      nil, ENV["AZURE_APP_ID"], ENV["AZURE_APP_SECRET"]
    )

    token = OAuth2::AccessToken.new(
      oauth_strategy.client, token_hash[:token],
      refresh_token: token_hash[:refresh_token]
    )

    # Refresh the tokens
    new_tokens = token.refresh!.to_hash.slice(:access_token, :refresh_token, :expires_at)

    # Rename token key
    new_tokens[:token] = new_tokens.delete :access_token

    # Store the new hash
    session[:graph_token_hash] = new_tokens
  end

  def access_token
    token_hash = session[:graph_token_hash]

    # Get the expiry time - 5 minutes
    expiry = Time.at(token_hash[:expires_at] - 300)

    if Time.now > expiry
      # Token expired, refresh
      new_hash = refresh_tokens token_hash
      new_hash[:token]
    else
      token_hash[:token]
    end
  end

  private
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      return unless session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end

    def authenticate
      return if logged_in?
      redirect_to root_path, alert: "ログインしてください"
    end
end
