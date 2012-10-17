require 'spec_helper'
require 'organization'

describe Organization do

  before do
    @it = Organization.new
  end

  it "should have these properties" do
    should have_property :id
    should have_property :name
    should have_property :homepage
    should have_property :facebook
    should have_property :twitter
    should have_property :phone_number
  end

  it "should have these relationships" do
    should have_many :events
    should belong_to :configgle
  end

  it "can have many members" do
    @it.add_member(double('member1'))
    @it.add_member(double('member2'))
    @it.members.size.should equal 2
  end
end
