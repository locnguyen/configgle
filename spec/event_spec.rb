require 'spec_helper'
require 'event'

describe Event do
  before do
    @event = Event.new(double('organization'))
  end

  it "should have these DataMapper properties" do
    @event.should have_property :id
    @event.should have_property :name
    @event.should have_property :start_date
    @event.should have_property :end_date
    @event.should have_property :homepage
    @event.should have_property :description
  end

  it "should have these DataMapper relationships" do
    @event.should belong_to :organization
  end

  it "can be created with an organization" do
    @event.should_not be_nil
  end

  it "cannot be created without an organization" do
    expect { Event.new }.to raise_error
  end
end
