class Organization
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :homepage, URI
  property :facebook, URI
  property :twitter, URI
  property :phone_number, String

  has n, :events
  belongs_to :rufiggle
end
