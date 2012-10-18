require 'spec_helper'
require 'membership'

describe Membership do

  before do
    @it = Membership.new({
      member: double('member'),
      organization: double('org')
    })
  end

  it "should have these DataMapper properties" do
    @it.should have_property :id
    @it.should have_property :member_id
    @it.should have_property :organization_id
  end

  it "should have these DataMapper relationships" do
  
  end

  it "cannot exist without a member" do
    expect { Membership.new({ organization: double('org')}) }.to raise_error
  end

  it "cannot exist without an organization" do
    expect { Membership.new({ member: double('member') }) }.to raise_error
  end


end
