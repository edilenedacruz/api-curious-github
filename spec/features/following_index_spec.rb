require 'rails_helper'

RSpec.feature "Following" do
  attr_reader :current_user
  before(:each) do
    @current_user = User.create(uid: "17166293", username: "edilenedacruz", avatar: "https://avatars1.githubusercontent.com/u/17166293?v=3", token: ENV['TOKEN'])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  scenario "I can see the user that I'm following" do
    VCR.use_cassette("features/following") do

      visit "/#{current_user.username}/following"

      expect(page).to have_content("JoshCheek")
      expect(page).to have_content("pixapi")
      expect(page).to have_css("h1")
    end
  end
end
