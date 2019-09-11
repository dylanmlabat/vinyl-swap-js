// $(function(){
//   console.log('albums.js is loaded...')
//   listenForClick()
// })
//
// function listenForClick(){
//   $('button#recent-listings').on('click', function(event){
//     event.preventDefault()
//     getAlbums()
//   })
// }
//
// function getAlbums(){
//   $.ajax({
//     url: 'http://localhost:3000/albums',
//     method: 'get',
//     dataType: 'json'
//   }).done(function(data){
//     console.log('the data is: ', data)
//     debugger
//   })
// }
//
// class Album {
//   constructor(album){
//     this.id = album.id
//     this.artist = album.artist
//     this.title = album.title
//     this.release_year = album.release_year
//     this.genre = album.genre
//     this.listings = album.listings
//   }
// }
