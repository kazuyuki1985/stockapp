require 'open-uri'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def evernote_auth
    callback_url = 'http://localhost:3000/evernote_auth'

    if params[:oauth_verifier]
      access_token = session[:request_token].get_access_token(oauth_verifier: params[:oauth_verifier])
      session[:access_token] = access_token.token
      redirect_to root_path
    else
      client = EvernoteOAuth::Client.new
      session[:request_token] = client.request_token(:oauth_callback => callback_url)
      redirect_to session[:request_token].authorize_url
    end
  end

  def evernote_auth_callback
    session[:access_token] = access_token.token
    redirect_to '/'
  end

end