require 'rails_helper'

describe 'GithubService' do
  attr_reader :service

  before(:each) do
    @service = GithubService.new
  end

  describe 'starred repos' do
    it 'returns all starred repos' do
      starred = @service.starred

      expect(starred.count).to eq(47)
    end
  end
end


# number of starred repos, followers, following)
