require 'rails_helper'

describe 'GithubService' do
  attr_reader :service


  before(:each) do
    current_user = User.new(uid: "17166293", username: "edilenedacruz", avatar: "https://avatars1.githubusercontent.com/u/17166293?v=3", token: ENV['TOKEN'])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

    @service = GithubUser.new(current_user)

  end

  describe 'get profie' do
    xit 'finds user profile information' do
      VCR.use_cassette("services/find_profile") do

        profile = @service

        expect(profile[:login]).to eq("edilenedacruz")
        expect(profile[:avatar_url]).to eq("https://avatars1.githubusercontent.com/u/17166293?v=3")
        expect(profile[:name]).to eq("Edilene")
        expect(profile[:email]).to eq("hello@edilene.io")
      end
    end
  end

  describe 'get starred' do
    xit 'finds users starred repositories' do
      VCR.use_cassette("services/find_starred") do

      starred = @service.starred
      first_star = starred.first

      expect(starred.count).to eq(48)
      expect(first_star.url).to eq("https://api.github.com/repos/s-espinosa/guaranty_records")
      end
    end
  end

  describe 'followers' do
    it 'finds all users that follows current user' do
      VCR.use_cassette("services/find_followers") do

        followers = @service.followers

        expect(followers.count).to eq(5)
        expect(followers).to be_an(Array)
      end
    end
  end

  describe 'following' do
    it 'finds all users that current user is following' do
      VCR.use_cassette("services/find_following") do

        following = @service.following

        expect(following.count).to eq(3)
        expect(following).to be_an(Array)
      end
    end
  end

  describe 'repos' do
    xit 'finds all repositories for user' do
      VCR.use_cassette("services/find_repos") do

        repos = @service.repos

        expect(repos.count).to eq(51)
        expect(repos).to be_an(Array)
      end
    end
  end

  describe 'organizations' do
    it 'finds all organizations that user participates in' do
      VCR.use_cassette("services/find_organizations") do

        organizations = @service.organizations

        expect(organizations.count).to eq(1)
      end
    end
  end

  describe 'recent events' do
    it 'finds recent activities initiated by user' do
      VCR.use_cassette("services/find_recent_activity") do

        events = @service.recent_events
        last_event = events.last

        expect(last_event.repo).to eq("edilenedacruz/api-curious-github")
        expect(last_event.action).to eq("closed")
        expect(events).to be_an(Array)
      end
    end
  end

  describe "followed users' recent activities" do
    it 'finds recent activites from users I follow' do
      VCR.use_cassette("services/find_activity_from_others") do

        others = @service.activity_from_others
        first_other = others.first

        expect(first_other.login).to eq("maxglassie")
        expect(first_other.repo_name).to eq("briancaffey/reddit-graph-analysis")
        expect(others).to be_an(Array)
      end
    end
  end
end
