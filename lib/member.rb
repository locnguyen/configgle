require 'data_mapper'

class Member
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :phone_number, String

  attr_reader :memberships

  def initialize
    @memberships = []
  end

  def add_membership(organization)
    @memberships << organization
  end
end
