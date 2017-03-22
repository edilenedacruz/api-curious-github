class FollowingController < ApplicationController
  def index
    @following = GithubUser.new(current_user).following
  end
end
