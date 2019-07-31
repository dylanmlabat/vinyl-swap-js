class Listing < ApplicationRecord
  validates :condition, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :user_id, presence: true
  validates :album_id, presence: true
  serialize :notes, JSON

  belongs_to :user
  belongs_to :album

  scope :listing_low_to_high, -> { order(:price) }

  NOTES = [
    'Sealed', '1st Pressing', 'Colored Vinyl', 'Picture Disc',
    'Limited Run', 'Promotional Release', 'Import'
  ]
end
