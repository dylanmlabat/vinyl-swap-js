$(function(){
  console.log('listings.js is loaded...')
  listenForClick()
})

function listenForClick(){
  $('button#recent-listings').on('click', function(event){
    event.preventDefault()
    getListings()
  })
}

function getListings(){
  $.ajax({
    url: 'http://localhost:3000/listings',
    method: 'get',
    dataType: 'json'
  }).done(function(data){
    console.log('the data is: ', data)
    let testlisting = new Listing(data[0])
    let myListingHTML = testlisting.listingHTML()
    debugger
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

Listing.prototype.listingHTML = function() {
  return (`
    ${this.album.artist} - ${this.album.title}<br>
    <small>Sold by ${this.user.username}</small><br>
    <small>${this.condition} - $${this.price}</small>
  `)
}
