require 'rails_helper'

RSpec.describe User, :type => :model do
  attr_reader :current_user, :access_token

  before(:each) do
    @current_user = User.create(uid: "17166293", username: "edilenedacruz", avatar: "https://avatars1.githubusercontent.com/u/17166293?v=3", token: ENV['TOKEN'])
    @access_token = ENV['TOKEN']

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  it "should have attributes" do
    VCR.use_cassette("models/user") do

      user = User.from_github(current_user, access_token)

      expect(current_user.username).to eq("edilenedacruz")
      expect(current_user.avatar).to eq("https://avatars1.githubusercontent.com/u/17166293?v=3")
      expect(current_user.token).to eq(ENV['TOKEN'])
    end
  end
end
