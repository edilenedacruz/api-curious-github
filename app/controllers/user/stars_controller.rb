class User::StarsController < ApplicationController
  before_action :authorize!
  def index
    @stars = GithubUser.new(current_user).starred
  end
end
