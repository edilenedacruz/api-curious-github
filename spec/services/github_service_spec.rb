require 'rails_helper'

describe 'GithubService' do
  attr_reader :service

  before(:each) do
    @service = GithubUser.new
  end

  describe 'starred repos' do
    xit 'returns all starred repos' do
      VCR.use_cassette("services/NAME OF MY CHOICE")

        starred = @service.starred

        expect(starred.count).to eq(47)
    end
  end
end
