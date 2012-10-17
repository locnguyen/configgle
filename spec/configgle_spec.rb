require 'spec_helper'
require 'configgle'

describe Configgle do
  before do
    @app = Configgle.new
  end

  it "should have these DataMapper properties" do
    should have_property :id
  end

  it "should have these DataMapper relationships" do
    should have_many :organizations
  end

  it "says hi" do
    Configgle.hi.should eq('Hello world!')
  end
end

