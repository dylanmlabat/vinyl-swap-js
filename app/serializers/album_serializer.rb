class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :artist, :title, :release_year, :genre
  has_many :listings
  has_many :users, :through => :listings
end
