$(function(){
  console.log('albums.js is loaded...')
  getAlbum()
  listenForNewAlbumFormClick()
})

function getAlbum(){
  let url = window.location.href
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

function listenForNewAlbumFormClick(){
  $('button#new-album-form-btn').on('click', function(event){
    event.preventDefault()
    document.getElementById('new-album-form-btn').disabled = true
    let newAlbumForm = Album.newAlbumForm()
    document.getElementById('new-album-form').innerHTML += newAlbumForm
    $(function(){
      $('form#album-form').submit(function(event) {
        event.preventDefault()
        var albumArtist = document.getElementById('album-artist').innerHTML
        var valueHash = {
          artist: albumArtist,
          title: this[0].value,
          release_year: this[1].value,
          genre: this[2].value
        }
        var album = {album: valueHash}
        var posting = $.post('/albums', album)
        posting.done(function(data){
          $("#artist-albums").load(" #artist-albums")
          document.getElementById('new-album-form').innerHTML = ''
          document.getElementById('new-album-form-btn').disabled = false
        })
      })
    })
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

  static newAlbumForm(){
    return (`
        <br><form id='album-form'>
          <label>Title:</label><br>
          <input type='text' name='title'><br><br>
          <label>Release Year:</label><br>
          <input type='text' name='release_year'><br><br>
          <label>Genre:</label><br>
          <input type='text' name='genre'><br><br>
          <input type='submit' value='Create Album'>
        </form>
    `)
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
