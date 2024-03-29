require 'spec_helper'
require 'member'
require 'organization'

describe Member do

  it { should have_property(:id).of_type(DataMapper::Property::Serial) }
  it { should have_property :first_name }
  it { should have_property :last_name }
  it { should have_property :email }
  it { should have_property :phone_number }

  it { should have_many :memberships }
  it { should have_many(:organizations).through(:memberships) }
  it { should have_many :registrations }

  it "can belong to more than one organization" do
    subject.add_membership Organization.new 
    subject.add_membership Organization.new
    subject.memberships.size.should equal 2
  end
end
