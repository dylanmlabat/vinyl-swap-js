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
    let album = new Album(data)
    let albumHTML = album.albumHTML()
    document.getElementById('show-album').innerHTML += albumHTML
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

Album.prototype.albumHTML = function(){
  return (`
    <h2><a href="/albums/by_artist/${this.artist.toLowerCase().replace(/[^a-z0-9]/g,'-')}">${this.artist}</a> - ${this.title}</h2>
    <b>Released:</b> ${this.release_year}<br>
    <b>Genre:</b> ${this.genre}<br><br>

    <h3>Copies for sale:</h3><br>
  `)
}
