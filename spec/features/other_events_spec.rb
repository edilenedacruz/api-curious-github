require 'rails_helper'

RSpec.feature "Other's activity" do
  attr_reader :current_user
  before(:each) do
    @current_user = User.create(uid: "17166293", username: "edilenedacruz", avatar: "https://avatars1.githubusercontent.com/u/17166293?v=3", token: ENV['TOKEN'])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  scenario "user can see recent activity from users (s)he follows" do
    VCR.use_cassette("features/other_events") do

      visit "/#{current_user.username}/dashboard"

      expect(page).to have_content("Recent activity from users I follow")
      expect(page).to have_content("maxglassie WatchEvent briancaffey/reddit-graph-analysis 3 days ago")
    end
  end
end
