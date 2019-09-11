class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :artist, :title, :release_year, :genre
  has_many :listings
end
