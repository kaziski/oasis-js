// $( document ).ready(function() {
$(() => {
  console.log('plant.js is loaded ...')
  listenForClick();
});

const listenForClick = () => {
  $('button#show-button').on('click', (e) => {
    e.preventDefault()
    console.log('clicked!!!!!!!')
    getPlants()
  } )
}

const getPlants =  () => {
  fetch(`/plants.json`)
    .then((res) => res.json())
    .then(plants => {
      $('button#show-button').hide()
      plants.forEach((plant) => {
        let newPlant = new Plant(plant)
        console.log(newPlant)
      })
      // $('#show-plants').html('oi!')
    }) 
}

function Plant(plant) {
  this.id = plant.id
  this.name = plant.name
  this.in_the_garden = plant.in_the_garden
  this.edible = plant.edible
  this.annual = plant.annual
}