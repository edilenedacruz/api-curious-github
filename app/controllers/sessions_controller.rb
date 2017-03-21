class SessionsController < ApplicationController
  def create
    @response = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV['GITHUB_KEY']}&client_secret=#{ENV['GITHUB_SECRET']}&code=#{params["code"]}")

    token = @response.body.split(/\W+/)[1]

    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")

    auth = JSON.parse(oauth_response.body)

    user = User.from_github(auth, token)

    session[:user_id] = user.id

    redirect_to dashboard_index_path
  end

  def destroy
    session.clear

    redirect_to root_path
  end
end
