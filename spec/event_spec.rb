require 'spec_helper'
require 'event'

describe Event do
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
end
