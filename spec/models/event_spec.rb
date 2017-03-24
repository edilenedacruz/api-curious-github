require 'rails_helper'

RSpec.describe Event, :type => :model do
  attr_reader :current_user

  before(:each) do
    @current_user = User.new(uid: "17166293", username: "edilenedacruz", avatar: "https://avatars1.githubusercontent.com/u/17166293?v=3", token: ENV['TOKEN'])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  xit "should have attributes" do
    VCR.use_cassette("models/all_events") do

      events = Event.activities(current_user)
      first_event = events.first

      expect(event.class).to be(Event)
      expect(events.class).to be_an(Array)
      expet(event.event_type).to eq("")
    end
  end
end
