class Album < ApplicationRecord
  validates :artist, presence: true, uniqueness: { scope: [:title, :release_year] }
  validates :title, presence: true, uniqueness: { scope: [:artist, :release_year] }
  validates :release_year, presence: true, uniqueness: { scope: [:artist, :title] }
  validates :genre, presence: true

  has_many :listings
  has_many :users, :through => :listings
end
