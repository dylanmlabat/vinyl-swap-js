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
