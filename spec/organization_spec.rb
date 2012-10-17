require 'spec_helper'
require 'organization'

describe Organization do

  before do
    @org = Organization.new
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
    should belong_to :rufiggle
  end
end
