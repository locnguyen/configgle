require 'data_mapper'

class Member
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :phone_number, String

  has n, :memberships
  has n, :organizations, :through => :memberships
  has n, :registrations

  attr_accessor :id, :first_name, :last_name, :email, :phone_number

  def initialize
    @memberships = []
  end

  def add_membership(organization)
    @memberships << organization
  end
end
