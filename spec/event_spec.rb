require 'spec_helper'
require 'event'
require 'organization'

describe Event, "belonging to some organization" do

  subject { Event.new({ organization: Organization.new }) }

  it { should have_property(:id).of_type(DataMapper::Property::Serial) }
  it { should have_property :name }
  it { should have_property :start_date }
  it { should have_property :end_date }
  it { should have_property :homepage }
  it { should have_property :description }
  it { should have_property :capacity }

  it { should belong_to :organization }
  it { should have_many :registrations }
  it { should have_many :registration_templates }

  it "can be created with an organization" do
    should_not be_nil
  end

  it "cannot be created without an organization" do
    expect { Event.new }.to raise_error
  end

  it "is over when today is past the end date" do
    subject.end_date = Date.today - 1
    subject.is_over?.should be_true
  end

  context "is happening now when" do
    it "has a start date that is before today and end date is after" do
      subject.start_date = Date.today - 5
      subject.end_date = Date.today + 5
      subject.is_happening_now?.should be_true
    end

    it "has a start date this is today" do
      subject.end_date = Date.today + 1
      subject.start_date =  Date.today
      subject.is_happening_now?.should be_true
    end

    it "has an end date that is today" do
      subject.start_date = Date.today - 1
      subject.end_date = Date.today
      subject.is_happening_now?.should be_true
    end
  end

  context "manages registration templates" do
    it "creates a template for the event" do
      tmpl = subject.create_registration_template(event: subject)
      tmpl.should be
    end

    it "creates and adds a template to the event" do
      tmpl_size = subject.registration_templates.size
      tmpl = subject.create_and_add_registration_template(event: subject)
      tmpl_size.should be < subject.registration_templates.size
    end
  end
end
