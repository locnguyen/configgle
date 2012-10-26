require 'spec_helper'
require 'registration_state'

describe RegistrationState do
  it { should have_property(:id).of_type(DataMapper::Property::Serial) }
  it { should have_property :code }
  it { should have_property :name }

  it { should have_many :registrations }
end
