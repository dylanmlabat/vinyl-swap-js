$(function(){
  console.log('listings.js is loaded...')
  getListings()
})

function getListings(){
  $.ajax({
    url: 'http://localhost:3000/listings',
    method: 'get',
    dataType: 'json'
  }).done(function(data){
    let recentListings = data.reverse()
    let startIndex = 5

    $('button#more-listings').on('click', function(event){
      event.preventDefault()
      for (i = 0; i < 5; i++){
        if (startIndex === recentListings.length){break}
        let listing = new Listing(recentListings[startIndex])
        let listingHTML = listing.listingHTML()
        document.getElementById('recent-listings').innerHTML += listingHTML
        startIndex++
      }
    })
  })
}

function getUser(){
  let url = window.location.href
  $.ajax({
    url: url,
    method: 'get',
    dataType: 'json'
  }).done(function(data){
    var listings = data
    $('button#sort-price-btn').on('click', function(event){
      event.preventDefault()
      document.getElementById('user-listings').innerHTML = ''
      let listingSort = listings.sort(function(a, b) {return a.price - b.price})
      for (i = 0; 1 < listingSort.length; i++){
        let listing = new Listing(listingSort[i])
        let userListingHTML = listing.userListingHTML()
        document.getElementById('user-listings').innerHTML += userListingHTML
      }
    })

    for (i = 0; 1 < listings.length; i++){
      let listing = new Listing(listings[i])
      let userListingHTML = listing.userListingHTML()
      document.getElementById('user-listings').innerHTML += userListingHTML
    }
  })
}

class Listing {
  constructor(listing){
    this.id = listing.id
    this.condition = listing.condition
    this.price = listing.price
    this.notes = listing.notes
    this.user_id = listing.user_id
    this.album_id = listing.album_id
    this.user = listing.user
    this.album = listing.album
  }
}

Listing.prototype.listingHTML = function(){
  return (`
    <a href="/users/${this.user.id}/listings/${this.id}">${this.album.artist} - ${this.album.title}</a><br>
    <small>Sold by <a href="/users/${this.user.id}">${this.user.username}</a></small><br>
    <small>${this.condition} - $${this.price}</small><br><br>
  `)
}

Listing.prototype.userListingHTML = function(){
  return (`
    <a href="/users/${this.user.id}/listings/${this.id}">${this.album.artist} - ${this.album.title}</a><br>
    <small>${this.condition} - $${this.price}</small><br><br>
  `)
}
