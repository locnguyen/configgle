require 'spec_helper'
require 'event'

describe Event, "belonging to some organization" do

  subject { Event.new({ organization: double('organization') }) }

  it { should have_property :id }
  it { should have_property :name }
  it { should have_property :start_date }
  it { should have_property :end_date }
  it { should have_property :homepage }
  it { should have_property :description }
  it { should belong_to :organization }

  it "can be created with an organization" do
    should_not be_nil
  end

  it "cannot be created without an organization" do
    expect { Event.new }.to raise_error
  end
end