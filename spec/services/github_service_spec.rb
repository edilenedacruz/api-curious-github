require 'rails_helper'

describe 'GithubService' do
  attr_reader :service

  before(:each) do
    @service = GithubService.new
  end

  describe 'starred repos' do
    it 'finds total of your starred repos' do
      starred = @service.find("starred_url")

      expect(starred).to eq(47)
    end
  end
end


# number of starred repos, followers, following)
