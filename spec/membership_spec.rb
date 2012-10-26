require 'spec_helper'
require 'membership'
require 'organization'
require 'member'

describe Membership, "between some organization and member" do

  subject {
    Membership.new({ member: Member.new, organization: Organization.new })
  }

  it { should have_property(:id).of_type(DataMapper::Property::Serial) }
  it { should have_property :member_id }
  it { should have_property :organization_id }
  it { should have_property :active }

  it { should belong_to :organization }
  it { should belong_to :member }

  it "cannot exist without a member" do
    expect { Membership.new({ organization: Organization.new }) }.to raise_error
  end

  it "cannot exist without an organization" do
    expect { Membership.new({ member: Member.new }) }.to raise_error
  end
end
