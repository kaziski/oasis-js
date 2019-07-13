$(() => {
  console.log('plant.js is loaded ...')
  listenForClick()
});

const listenForClick = () => {
  $('button#show-button').on('click', (e) => {
    e.preventDefault()
    // history.pushState(null, null, "plants")
    getPlants()
  })

  $(document).on('click', ".show-link", function(e) {
    e.preventDefault()
    let id = $(this).attr('data-id')
    fetch(`/plants/${id}.json`)
    .then((res) => res.json())
    .then(plant => {
      let newPlant = new Plant(plant)
      let showPlantHtml = newPlant.formatShow()
      $('#show-plants').html('')

      $('#show-plants').append(showPlantHtml)
    })
  })

}

const getPlants =  () => {
  fetch(`/plants.json`)
    .then((res) => res.json())
    .then(plants => {
      $('button#show-button').hide()
      plants.forEach((plant) => {
        let newPlant = new Plant(plant)
        let plantHtml = newPlant.formatIndex()
        $('#show-plants').append(plantHtml)
    })
    console.log('Index is loaded...')
  }) 
}

function Plant(plant) {
  this.id = plant.id
  this.name = plant.name
  this.in_the_garden = plant.in_the_garden
  this.edible = plant.edible
  this.annual = plant.annual
}

Plant.prototype.formatIndex = function() {
  let plantHtml = `
  <ul>
    <li><a href="/plants/${this.id}" data-id="${this.id}" class="show-link">${this.name}</a></li>
  </ul>
  `
  return plantHtml
}

Plant.prototype.formatShow = function() {
  let showPlantHtml = `<h3>${this.name}</h3>
  <div class="in-garden">
    ${
      (in_the_garden => {
        if (in_the_garden == true)
        return `<h4>is planted in your garden.</h4>`
        else 
        return `<h4>is not planted in your garden yet.</h4>`
      })(this.in_the_garden)
    }
  </div>
  `
  return showPlantHtml
}
  

