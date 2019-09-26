$(function(){
  console.log('users.js is loaded...')
  getUser()
})

class User {
  constructor(user){
    this.id = user.id
    this.username = user.username
    this.email = user.email
    this.listings = user.listings
    this.albums = user.albums
  }
}
