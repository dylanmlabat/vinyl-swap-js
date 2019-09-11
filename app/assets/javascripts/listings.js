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
    debugger
  })
}

class Listings {
  constructor(listing){
    this.id = listing.id
    this.condition = listing.condition
    this.price = listing.price
    this.notes = listing.notes
    this.user_id = listing.user_id
    this.album_id = listing.album_id
    this.users = listing.users
    this.albums = listing.albums
  }
}
