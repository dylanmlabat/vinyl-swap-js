class ListingSerializer < ActiveModel::Serializer
  attributes :id, :condition, :price, :notes, :user_id, :album_id
  belongs_to :user
  belongs_to :album
end
