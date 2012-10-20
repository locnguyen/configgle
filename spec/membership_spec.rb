require 'spec_helper'
require 'membership'

describe Membership, "between some organization and member" do

  subject { Membership.new({ member: double('member'), organization: double('org') }) }

  it { should have_property :id }
  it { should have_property :member_id }
  it { should have_property :organization_id }
  it { should have_property :active }

  it { should belong_to :organization }
  it { should belong_to :member }

  it "cannot exist without a member" do
    expect { Membership.new({ organization: double('org') }) }.to raise_error
  end

  it "cannot exist without an organization" do
    expect { Membership.new({ member: double('member') }) }.to raise_error
  end
end
