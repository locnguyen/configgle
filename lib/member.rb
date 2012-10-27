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

  attr_reader :id, :first_name, :last_name, :email, :phone_number, :memberships, :registrations

  def initialize
    @registrations = []
    @organizations = []
    @memberships = []
  end

  def add_membership(organization)
    @memberships << organization
  end
end
