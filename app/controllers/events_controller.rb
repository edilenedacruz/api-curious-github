class EventsController < ApplicationController
  before_action :authorize!
  @events = GithubUser.new(current_user).recent_events
end
