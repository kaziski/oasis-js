$(() => {
  if ($('.logged-in').length){
    listenForClick()
  }
})

const listenForClick = () => {
  $('button#show-button').on('click', (e) => {
    e.preventDefault()
    // history.pushState(null, null, "plants")
    showPlants()
  })
}

const showPlants =  () => {
  fetch(`/plants.json`)
    .then((res) => res.json())
    .then(plants => {
      $('button#show-button').hide()
      plants.forEach((plant) => {
        let newPlant = new Plant(plant)
        //line 124
        let plantHtml = newPlant.formatIndex()
        //line 133
        $('#show-plants').append(plantHtml)
    })
    showSinglePlant()
  }) 
}

const showSinglePlant = () => {
  $(document).on('click', ".show-link", function(e) {
    e.preventDefault()
    let id = $(this).data("id")
    fetch(`/plants/${id}.json`)
    .then((res) => res.json())
    .then(plant => {
      let newPlant = new Plant(plant)
      //line 124
      let showPlantHtml = newPlant.formatShow()
      //line 143
      let showPlantsAgainHtml = `
      <div id='show-plants-again'>
        <button id="show-again-button">Show Plants Again</button>
      </div>
      `
      $('#show-plants').html('')
      $('#show-plants').append(showPlantHtml).append(showPlantsAgainHtml)

      getActions()
      showPlantsAgain()
    })
  })
}

const showPlantsAgain = () => {
  $('button#show-again-button').on('click', (e) => {
    e.preventDefault()
    fetch(`/plants.json`)
    .then((res) => res.json())
    .then(plants => {
      $('div#show-plants').html('')
      plants.forEach((plant) => {
        let newPlant = new Plant(plant)
        let plantHtml = newPlant.formatIndex()
        $('div#show-plants').append(plantHtml)
      })
    }) 
  })
}

const getActions = () => {
  $('button#action-button').on('click', function (e) {
    e.preventDefault()
    let id = $(this).data("id")
    let actionList = ""
    let plantActionList = ""
    let noActionHtml = ""
    fetch(`/plants/${id}.json`)
    .then((res) => res.json())
    .then(plantsObj => {
      if (plantsObj.actions.length > 0){
        $('button#action-button').hide()
      plantsObj.actions.forEach((action) => {
        actionList += `<ul>
          <li>${action["action_name"]}</li>
        </ul>
        `
      })
      plantsObj.plants_actions.forEach((plant_action) => {
        plantActionList += `<ul>
        <li style="list-style: none;">${plant_action["action_date"]}</li>
      </ul>
      `
      })
      $('div#action').append(actionList)
      $('div#action-date').append(plantActionList)
      }else{
        $('button#action-button').hide()
        noActionHtml = `<p>You haven't logged any actions yet.</p>`
        $('.annual').append(noActionHtml)
      }
    })
  })
}

$(() => {
  if ($('.form-container').length){
    handleSubmit()
  }
});

const handleSubmit = () => {
    $('form').submit(function(e) {
    e.preventDefault()
    const values = $(this).serialize()
    $.post('/plants', values)
    .done(function(data){
      $('#app-container').html('')
      const newPlant = new Plant(data)           
      const htmlToAdd = newPlant.formatShow()
      $('#app-container').append(htmlToAdd)
      getActions()
    })
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
  <ul class="plant-ul"> 
    <li><a href="/plants/${this.id}" data-id="${this.id}" class="show-link">${this.name}</a></li>
  </ul>
  `
  return plantHtml
}

Plant.prototype.formatShow = function() {
  let showPlantHtml = `
  <h3 data-id="${this.id}">${this.name}</h3>
  <br>
  <div class="in-garden">
    ${
      (in_the_garden => {
        if (in_the_garden == true)
        return `<h4>is planted in your garden,</h4>`
        else 
        return `<h4>is not planted in your garden yet,</h4>`
      })(this.in_the_garden)
    }
  </div>
  <div class="edible">
    ${
      (edible => {
        if (edible == true)
        return `<h4>is edible,</h4>`
        else 
        return `<h4>is not edible,</h4>`
      })(this.edible)
    }
  </div>
  <div class="annual">
    ${
      (annual => {
        if (annual == true)
        return `<h4>and is an annual plant.</h4>`
        else 
        return `<h4>and is not an annual plant.</h4>`
      })(this.annual)
    }
  </div><br><br>
  
  <div id='show-actions'>
        <div class="action-grid">
          <div id="action"></div>
          <div id="action-date"></div>
        </div>
        <button data-id="${this.id}" id="action-button">View actions</button>
  </div>
  <br><br><br><br>
  `
  return showPlantHtml
}
  

