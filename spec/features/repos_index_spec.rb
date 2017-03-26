require 'rails_helper'

RSpec.feature "Repos" do
  attr_reader :current_user
  before(:each) do
    @current_user = User.create(uid: "17166293", username: "edilenedacruz", avatar: "https://avatars1.githubusercontent.com/u/17166293?v=3", token: ENV['TOKEN'])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  scenario "I can see all my repositories" do
    VCR.use_cassette("features/repos") do

      visit "/#{current_user.username}/repos"

      expect(page).to have_content("Repositories")
      expect(page).to have_content("99_bottles")
      expect(page).to have_link("Return to Dashboard")
    end
  end
end
