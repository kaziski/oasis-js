User.create(username: 'kazumi', email: 'kazumi@gmail.com', password: '123456', admin: true) 
User.create(username: 'john', email: 'john@gmail.com', password: '123456')
User.create(username: 'keima', email: 'keima@gmail.com', password: '123456')
User.create(username: 'jion', email: 'jion@gmail.com', password: '123456')
User.create(username: 'admin', email: 'admin@gmail.com', password: '123456', admin: true)


plant_list = [
  ['Tulip', false, false, true, 2],
  ['Peony', false, false, false, 2],
  ['Tomato', false, true, true, 3],
  ['Thyme', true, true, false, 4],
  ['Calendula', true, false, false, 2],
  ['Green Bean', false, true, true, 3],
  ['Green Onion', false, true, true, 3],
  ['Lily', false, false, false, 3],
  ['Tomato', false, true, true, 3],
  ['Gardenia', false, false, true, 4],
  ['Daffodils', false, false, true, 4],
]

plant_list.each do |plant|
  Plant.create(name: plant[0], in_the_garden: plant[1], edible: plant[2], annual: plant[3], user_id: plant[4])
end

action_list = ['Seed', 'Plant', 'Bloom', 'Harvest']

action_list.each do |action|
  Action.create(action_name: action)
end
