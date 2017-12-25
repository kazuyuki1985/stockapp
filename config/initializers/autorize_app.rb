require "sinatra"
require "evernote_oauth"
require "haml"

use Rack::Session::Cookie,
  :key => "rack.session",
  :domain => "localhost",
  :path => "/",
  :expire_after => 3600,
  :secret => SecureRandom.hex(32)

get "/" do
  client = EvernoteOAuth::Client.new(
    :consumer_key => "kazuyan0806",
    :consumer_secret => "1623b846a079a701",
    :sandbox => true
  )
  callback_url = "#{request.url}callback"
  request_token = client.request_token(:oauth_callback => callback_url)
  session[:request_token] = request_token

  @authorize_url = request_token.authorize_url
  haml :index # ここで@authorize_urlを表示している
end

get "/callback" do
    request_token = session[:request_token]
    verifier = params[:oauth_verifier]
    access_token = request_token.get_access_token(oauth_verifier: verifier)
    @token = access_token.token
  
    haml :callback # ここでトークンを表示している
  end