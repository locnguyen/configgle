require 'spec_helper'
require 'registration_template'
require 'organization'
require 'event'

describe RegistrationTemplate do

  subject {
    e = Event.new(organization: Organization.new)
    RegistrationTemplate.new(event: e)
  }

  it { should have_property(:id).of_type(DataMapper::Property::Serial) }
  it { should have_property(:template).of_type(DataMapper::Property::Json) }
  it { should have_property :name }
  it { should have_property :description }
  it { should have_property :created_at }
  it { should have_property :updated_at }

  it { should belong_to :event }
  it { should have_many :registrations }

  it "is only created for event" do
    expect { RegistrationTemplate.new }.to raise_error(ArgumentError, 'Cannot create template without event')
  end
end
