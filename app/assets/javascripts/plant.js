// $( document ).ready(function() {
$(() => {
  console.log('plant.js is loaded ...')
  listenForClick();
});

const listenForClick = () => {
  $('button#show-button').on('click', () => {
    event.preventDefault()
    console.log('clicked!!!!!!!')
    getPlants()
  } )
}

const getPlants =  () => {
  fetch(`/plants.json`)
    .then((res) => res.json())
    .then(data => {
      $('button#show-button').hide()
      $('#show-plants').html('oi!')
    }) 
}