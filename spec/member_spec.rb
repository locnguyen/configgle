require 'spec_helper'
require 'member'

describe Member do

  it "should have these DataMapper properties" do
    should have_property :id
    should have_property :first_name
    should have_property :last_name
    should have_property :email
    should have_property :phone_number
  end

  it "should have these DataMapper relationships" do
      should have_many :memberships
      should have_many(:organizations).through(:memberships)
  end

  it "should have these DataMapper relationships" do
    @it.should have_many(:organizations).through(:memberships)
  end

  it "can belong to more than one organization" do
    subject.add_membership(double("org1"))
    subject.add_membership(double("org2"))

    subject.memberships.size.should equal 2
  end
end
