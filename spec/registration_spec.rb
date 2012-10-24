require 'spec_helper'
require 'registration'

describe Registration do

  subject { Registration.new({ event: double('event'), member: double('member') }) }

  it { should have_property(:id).of_type(DataMapper::Property::Serial) }
  it { should have_property :completed_date }

  it { should belong_to :event }
  it { should belong_to :member }

  it "cannot not be created without an event" do
    expect { Registration.new( member: double('member') )}.to raise_error
  end

  it "cannot be created without an member" do
    expect { Registration.new( event: double('event') )}.to raise_error
  end
end
