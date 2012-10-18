require 'data_mapper'

class Membership
  include DataMapper::Resource

  property :id, Serial
  property :member_id, Integer
  property :organization_id, Integer

  def initialize(args = {})
    @member = args[:member]
    @organization = args[:organization]

    raise(ArgumentError, 'Missing member', caller) if @member.nil?
    raise(ArgumentError, 'Missing organization', caller) if @organization.nil?
  end
end
