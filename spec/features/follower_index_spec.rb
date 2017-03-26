require 'rails_helper'

RSpec.feature "Followers" do
  attr_reader :current_user
  before(:each) do
    @current_user = User.create(uid: "17166293", username: "edilenedacruz", avatar: "https://avatars1.githubusercontent.com/u/17166293?v=3", token: ENV['TOKEN'])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  scenario "I can see the users that are currently following me" do
    VCR.use_cassette("features/followers") do

      visit "/#{current_user.username}/followers"

      expect(page).to have_content("Carmer")
      expect(page).to have_content("pixapi")
      expect(page).to have_css("h1")
      expect(page).to have_content("Followers")
      expect(page).to have_link("Return to Dashboard")
    end
  end
end
