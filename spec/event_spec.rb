require 'spec_helper'
require 'event'

describe Event, "belonging to some organization" do

  subject { Event.new({ organization: double('organization') }) }

  it "should have these DataMapper properties" do
    should have_property :id
    should have_property :name
    should have_property :start_date
    should have_property :end_date
    should have_property :homepage
    should have_property :description
  end

  it "should have these DataMapper relationships" do
    should belong_to :organization
  end

  it "can be created with an organization" do
    should_not be_nil
  end

  it "cannot be created without an organization" do
    expect { Event.new }.to raise_error
  end
end
