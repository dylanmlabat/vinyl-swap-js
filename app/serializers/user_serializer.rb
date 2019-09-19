class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  has_many :listings
  has_many :albums, :through => :listings
end
