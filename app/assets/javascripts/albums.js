$(function(){
  console.log('albums.js is loaded...')
  getAlbums()
})

function getAlbums(){
  $.ajax({
    url: 'http://localhost:3000/albums',
    method: 'get',
    dataType: 'json'
  }).done(function(data){
    console.log('the data is: ', data)
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
  }
}
