class User::FollowingController < ApplicationController
  before_action :authorize!
  def index
    @following = GithubUser.new(current_user).following
  end
end
