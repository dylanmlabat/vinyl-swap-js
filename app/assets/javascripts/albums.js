$(function(){
  console.log('albums.js is loaded...')
})

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
