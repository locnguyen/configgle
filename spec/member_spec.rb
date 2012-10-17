require 'spec_helper'
require 'member'

describe Member do

  before do
    @it = Member.new
  end

  it "should have these DataMapper properties" do
    @it.should have_property :id
    @it.should have_property :first_name
    @it.should have_property :last_name
    @it.should have_property :email
    @it.should have_property :phone_number
  end

  it "can belong to more than one organization" do
    @it.add_membership(double("org1"))
    @it.add_membership(double("org2"))

    @it.memberships.size.should equal 2
  end
end
