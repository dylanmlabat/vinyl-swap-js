# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: 'Dylan', email: 'dylan@me.com', password: 'dylanpass')
user2 = User.create(username: 'Elise', email: 'elise@me.com', password: 'elisepass')
user3 = User.create(username: 'April', email: 'april@me.com', password: 'aprilpass')
user4 = User.create(username: 'Whit', email: 'whit@me.com', password: 'whitpass')
user5 = User.create(username: 'Alex', email: 'alex@me.com', password: 'alexpass')

album1 = Album.create(artist: 'David Bowie', title: 'Station to Station', release_year: '1976', genre: 'Rock')
album2 = Album.create(artist: 'Onyx', title: 'All We Got Iz Us', release_year: '1995', genre: 'Hip Hop')
album3 = Album.create(artist: 'Unwound', title: 'Leaves Turn Inside You', release_year: '2001', genre: 'Punk')
album4 = Album.create(artist: 'Nick Drake', title: 'Pink Moon', release_year: '1972', genre: 'Folk')
album5 = Album.create(artist: 'Fugazi', title: 'Repeater', release_year: '1990', genre: 'Punk')
album6 = Album.create(artist: 'Joanna Newsom', title: 'Ys', release_year: '2006', genre: 'Folk')
album7 = Album.create(artist: 'Charles Mingus', title: 'The Black Saint and the Sinner Lady', release_year: '1963', genre: 'Jazz')
album8 = Album.create(artist: 'Bill Evans Trio', title: 'Waltz for Debby', release_year: '1961', genre: 'Jazz')
album9 = Album.create(artist: 'MF DOOM', title: 'Mm..Food', release_year: '2004', genre: 'Hip Hop')
album10 = Album.create(artist: 'King Crimson', title: 'Red', release_year: '1974', genre: 'Rock')
album11 = Album.create(artist: 'Bill Evans Trio', title: 'Sunday at the Village Vanguard', release_year: '1961', genre: 'Jazz')
album12 = Album.create(artist: 'David Bowie', title: 'Low', release_year: '1977', genre: 'Rock')

listing1 = Listing.create(condition: 'Near Mint', price: 19, user_id: 1, album_id: 3)
listing2 = Listing.create(condition: 'Mint', price: 23, user_id: 2, album_id: 2)
listing3 = Listing.create(condition: 'Good', price: 14, user_id: 3, album_id: 4)
listing4 = Listing.create(condition: 'Very Good', price: 16, user_id: 4, album_id: 6)
listing5 = Listing.create(condition: 'Good', price: 12, user_id: 5, album_id: 9)
listing6 = Listing.create(condition: 'Mint', price: 22, user_id: 1, album_id: 7)
listing7 = Listing.create(condition: 'Near Mint', price: 18, user_id: 2, album_id: 10)
listing8 = Listing.create(condition: 'Poor', price: 4, user_id: 3, album_id: 4)
listing9 = Listing.create(condition: 'Very Good', price: 12, user_id: 4, album_id: 1)
listing10 = Listing.create(condition: 'Poor', price: 6, user_id: 5, album_id: 8)
