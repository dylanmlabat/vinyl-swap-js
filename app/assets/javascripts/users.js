$(function(){
  console.log('users.js is loaded...')
  getAlbum()
})

function getAlbum(){
  url = window.location.href
  $.ajax({
    url: url,
    method: 'get',
    dataType: 'json'
  }).done(function(data){
    console.log('the data is: ', data)
    debugger
  })
}

class User {
  constructor(user){
    this.id = user.id
    this.username = user.username
    this.email = user.email
    this.listings = user.listings
  }
}
