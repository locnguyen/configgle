require 'spec_helper'
require 'registration'

describe Registration do

  subject { Registration.new({ event: double('event'), member: double('member') }) }

  it { should have_property(:id).of_type(DataMapper::Property::Serial) }
  it { should have_property :completed_date }

  it { should belong_to :event }
  it { should belong_to :member }

  it "cannot not be created without an event" do
    expect {
      Registration.new( member: double('member') )
    }.to raise_error(ArgumentError, 'Need an event to create a registration')
  end

  it "cannot be created without a member" do
    expect {
      Registration.new( event: double('event'), member: nil )
    }.to raise_error(ArgumentError, 'Need member to create a registration')
  end

  it "is created with an event" do
    subject.event.should be
  end

  it "is created with a member" do
    subject.member.should be
  end
end
