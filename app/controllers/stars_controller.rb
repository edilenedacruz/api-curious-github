class StarsController < ApplicationController
  def index
    @stars = GithubUser.new(current_user).starred
  end
end
