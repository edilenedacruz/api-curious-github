require 'rails_helper'

describe 'GithubService' do
  attr_reader :service


  before(:each) do
    current_user = User.new(uid: "17166293", username: "edilenedacruz", avatar: "https://avatars1.githubusercontent.com/u/17166293?v=3")

    @service = GithubUser.new(current_user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  describe 'get profile' do
    it 'finds user profile information' do
      VCR.use_cassette("services/find_profile") do

        profile = @service.get

        expect(profile.count).to eq(47)
    end
  end
end
