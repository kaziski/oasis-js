User.create(username: 'kazumi', email: 'kazumi@gmail.com', password: 'password') 
User.create(username: 'john', email: 'john@gmail.com', password: 'password')


plant_list = [
  ['Tulip', false, false, true, 1],
  ['Peony', false, false, false, 2],
  ['Tomato', false, true, true, 1],
  ['Thyme', true, true, false, 1],
  ['Calendula', true, false, false, 2]
]

plant_list.each do |plant|
  Plant.create(name: plant[0], in_the_garden: plant[1], edible: plant[2], annual: plant[3], user_id: plant[4])
end

action_list = ['Seed', 'Plant', 'Bloom', 'Harvest']

action_list.each do |action|
  Action.create(action_name: action)
end
