require 'rails_helper'

RSpec.feature "Home dashboard" do
  before(:each) do
    current_user = User.create(uid: "17166293", username: "edilenedacruz", avatar: "https://avatars1.githubusercontent.com/u/17166293?v=3", token: ENV['TOKEN'])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  scenario "as a logged in user I see dashboard info" do
    VCR.use_cassette("features/dashboard") do

    visit "/edilenedacruz/dashboard"

    expect(page).to have_content("Edilene")

    expect(page).to have_link("Logout")
    expect(page).to have_link("Stars")
    expect(page).to have_link("Followers")
    expect(page).to have_link("Following")
    expect(page).to have_link("Repositories")
    expect(page).to have_content("hello@edilene.io")
    expect(page).to have_content("edilenedacruz")
    expect(page).to have_content("My recent activity")
    expect(page).to have_content("Recent activity from users I follow")
    end
  end
end
