class User::FollowersController < ApplicationController
  before_action :authorize!
  def index
    @followers = GithubUser.new(current_user).followers
  end
end
