require 'spec_helper'
require 'organization'
require 'event'
require 'member'

describe Organization do

  it { should have_property(:id).of_type(DataMapper::Property::Serial) }
  it { should have_property :name }
  it { should have_property :homepage }
  it { should have_property :facebook }
  it { should have_property :twitter }
  it { should have_property :phone_number }

  it { should have_many :events }
  it { should have_many :memberships }
  it { should have_many(:members).through(:memberships) }
  it { should belong_to :configgle }

  it "can have many members" do
    subject.add_member Member.new
    subject.add_member Member.new
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
    subject.events << subject.init_event {}
    subject.events << subject.init_event {}
    subject.total_events.should == 2
  end

  it "creates and adds to the organization's events" do
    init_events_size = subject.events.size
    subject.create_and_add_event({ name: 'TestEvent' })
    subject.events.size.should be > init_events_size
  end
end
