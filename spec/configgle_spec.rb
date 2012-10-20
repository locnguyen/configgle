require 'spec_helper'
require 'configgle'

describe Configgle do
  it { should have_property :id }
  it { should have_many :organizations }
end

