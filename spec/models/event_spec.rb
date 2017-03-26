require 'rails_helper'

RSpec.describe Event, :type => :model do
  attr_reader :current_user

  before(:each) do
    @current_user = User.new(uid: "17166293", username: "edilenedacruz", avatar: "https://avatars1.githubusercontent.com/u/17166293?v=3", token: ENV['TOKEN'])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  it "should have attributes" do
    VCR.use_cassette("models/all_events") do

      events = Event.activities(current_user)
      first_event = events.first

      expect(first_event.class).to be(Event)
      expect(first_event.event_type).to eq("DeleteEvent")
      expect(first_event.username).to eq("edilenedacruz")
      expect(first_event.repo).to eq("edilenedacruz/api-curious-github")
      expect(first_event.created_at).to eq("2017-03-24T06:10:32Z")
      expect(first_event.action).to be_nil
    end
  end
end
