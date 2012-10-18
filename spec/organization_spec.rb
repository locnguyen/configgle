require 'spec_helper'
require 'organization'

describe Organization do

  it "should have these DataMapper properties" do
    should have_property :id
    should have_property :name
    should have_property :homepage
    should have_property :facebook
    should have_property :twitter
    should have_property :phone_number
  end

  it "should have these DataMapper relationships" do
    should have_many :events
    should have_many :memberships
    should have_many(:members).through(:memberships)
    should belong_to :configgle
  end

  it "can have many members" do
    subject.add_member(double('member1'))
    subject.add_member(double('member2'))
    subject.members.size.should equal 2
  end

  it "can init an event" do
    # Make sure #init_event exists
    subject.init_event {}
  end

  it "initializes an event" do
    e = subject.init_event({ name: 'TestEvent' })
    e.name.should eq 'TestEvent'
  end

  it "initializes an event without adding to the organization's list of events" do
    init_size = subject.events.size
    subject.init_event({ name: 'TestEvent' })
    subject.events.size.should be == init_size
  end

  it "can create an event and add to the organization's list of events" do
    # Make sure #create_and_add_event exists
    subject.create_and_add_event {}
  end

  it "tells the correct number of events for the organization" do
    subject.events << double("event1")
    subject.events << double("event2")
    subject.total_events.should == 2
  end

  it "creates and adds to the organization's events" do
    init_events_size = subject.events.size
    subject.create_and_add_event({ name: 'TestEvent' })
    subject.events.size.should be > init_events_size
  end
end
