require 'rails_helper'

RSpec.feature "Stars index" do
  attr_reader :current_user
  before(:each) do
    @current_user = User.create(uid: "17166293", username: "edilenedacruz", avatar: "https://avatars1.githubusercontent.com/u/17166293?v=3", token: ENV['TOKEN'])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  scenario "as a logged in user I can view my starred repos" do
    VCR.use_cassette("features/stars") do
    visit "/#{current_user.username}/dashboard"

    click_link("Stars")

    expect(page).to have_content("Starred Repos")
    expect(page).to_not have_content("Logout")
    expect(page).to have_link("Return to Dashboard")
    end
  end
end
