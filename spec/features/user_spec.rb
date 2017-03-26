require 'rails_helper'

RSpec.feature "User" do
  attr_reader :current_user
  before(:each) do
    @current_user = User.create(uid: "17166293", username: "edilenedacruz", avatar: "https://avatars1.githubusercontent.com/u/17166293?v=3", token: ENV['TOKEN'])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  scenario "a signed user has attributes" do
    VCR.use_cassette("features/user") do

      visit "/#{current_user.username}/dashboard"

      expect(page).to have_content("Edilene")
      expect(page).to have_content("hello@edilene.io")
      expect(page).to have_css(".avatar")
    end
  end
end
