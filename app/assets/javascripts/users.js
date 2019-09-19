$(function(){
  console.log('users.js is loaded...')
  getUser()
})

function getUser(){
  let url = window.location.href
  $.ajax({
    url: url,
    method: 'get',
    dataType: 'json'
  }).done(function(data){
    let user = new User(data)
    for (i = 0; i < user.listings.length; i++){
      let listing = new Listing(user.listings[i])
      debugger
    }
  })
}

class User {
  constructor(user){
    this.id = user.id
    this.username = user.username
    this.email = user.email
    this.listings = user.listings
    this.albums = user.albums
  }
}
