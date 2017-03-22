class SessionsController < ApplicationController
  attr_reader :access_token
  def create
    github_oauth = GithubOauth.new(params['code'])
    access_token = github_oauth.access_token
    data = github_oauth.data

    user = User.from_github(data, access_token)

    session[:user_id] = user.id

    redirect_to dashboard_index_path
  end

  def destroy
    session.clear

    redirect_to root_path
  end
end
