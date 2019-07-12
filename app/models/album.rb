class Album < ApplicationRecord
  validates :artist, presence: true
  validates :title, presence: true
  validates :release_year, presence: true
  validates :genre, presence: true
end
