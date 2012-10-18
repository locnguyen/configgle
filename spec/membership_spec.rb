require 'spec_helper'
require 'membership'

describe Membership, "between some organization and member" do

  subject { Membership.new({ member: double('member'), organization: double('org') }) }

  it "should have these DataMapper properties" do
    should have_property :id
    should have_property :member_id
    should have_property :organization_id
  end

  it "should have these DataMapper relationships" do
    should belong_to :organization
    should belong_to :member
  end

  it "cannot exist without a member" do
    expect { Membership.new({ organization: double('org') }) }.to raise_error
  end

  it "cannot exist without an organization" do
    expect { Membership.new({ member: double('member') }) }.to raise_error
  end
end
