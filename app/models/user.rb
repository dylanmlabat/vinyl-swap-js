class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  validates :password, presence: true

  has_many :listings
  has_many :albums, :through => :listings
end
