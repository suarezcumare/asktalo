# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts '**********************************************************'
puts '***********   creating Users  ****************************'
usersSC= User.create(email: 'softwarecriollo@softwarecriollo.com', password: '12345678',first_name: 'software', last_name:'criollo')
usersTS = User.create(email: 'tony@softwarecriollo.com', password: '12345678', first_name: 'tony', last_name:'suarez', twitter: 'tonysc', github: 'tonysc')
usersAC = User.create(email: 'user@example.com', password: '12345678', first_name: 'user', last_name:'last user')
puts '***********    Users Created  ****************************'
puts '**********************************************************'

puts '**********************************************************'
puts '***********   Creating Question  *************************'
questions1=Question.create(description: 'rails problem', user_id: usersSC.id)
Question.create(description: 'Shell script - search for a line and display line and 3 trailing lines', user_id: usersSC.id)
Question.create(description: 'Pandas Dataframa manual EWMA calculation not working as expected. Formula copy down over column?', user_id: usersSC.id)
questions2 =Question.create( description: 'plataform softwarecriollo', user_id: usersTS.id)
puts '***********    Questions Created  ************************'
puts '**********************************************************'


puts '**********************************************************'
puts '***********   Creating Answer    *************************'
Answer.create(description: 'the rails problem is very error in plataform', answer_correct: false, question_id: questions1.id, user_id: usersTS.id)
Answer.create(description: 'the rails problem is', question_id: questions1.id, answer_correct: true, user_id: usersAC.id)
puts '***********    Answer created ****************************'
puts '**********************************************************'


puts '**********************************************************'
puts '***********   Creating Label     *************************'
Label.create(name: "Ruby", description: "Ruby", available: true)
Label.create(name: "Rails", description: "Rails", available: true)
Label.create(name: "javascript", description: "javascript", available: true)
Label.create(name: "Java", description: "Java", available: false)
puts '***********    Label created ****************************'
puts '**********************************************************'
