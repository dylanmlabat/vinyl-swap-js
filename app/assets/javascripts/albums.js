$(function(){
  console.log('albums.js is loaded...')
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

class Album {
  constructor(album){
    this.id = album.id
    this.artist = album.artist
    this.title = album.title
    this.release_year = album.release_year
    this.genre = album.genre
    this.listings = album.listings
    this.users = album.users
  }
}
