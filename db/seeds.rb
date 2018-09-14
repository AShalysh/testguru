# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{first_name: 'Ivan', last_name: 'Ivanov'}, {first_name: 'Peter', last_name: 'Petrov'}])
categories = Category.create!([{ title: 'frontend' }, { title: 'backend' }, { title: 'mobile development' }])
tests = Test.create!([{ title: 'HTML', level: 1, category: categories[0], author: users[0] }, { title: 'Ruby', level: 3, category: categories[2], author: users[1] }, { title: 'CSS', level: 2, category: categories[0], author: users[0] }, { title: 'C#', level: 3, category: categories[1], author: users[1] }, { title: 'Java', level: 1, category: categories[1], author: users[0] }])
questions = Question.create!([{ body: 'Question HTML?', test: tests[0] }, { body: 'Question Ruby?', test: tests[1] }, { body: 'Question CSS?', test: tests[2] }, { body: 'Question C#?', test: tests[3] }, { body: 'Question Java?', test: tests[4] }])
answers = Answer.create!([{ body: 'Answer HTML', correct: true, question: questions[0] }, { body: 'Answer Ruby', correct: true, question: questions[1] }, { body: 'Answer CSS', correct: false, question: questions[2] }, { body: 'Answer C#', correct: true, question: questions[3] }, { body: 'Answer Java', correct: false, question: questions[4] }])

TestUser.create!([{user: users[0], test: tests[0]}, {user: users[0], test: tests[1]}, {user: users[1], test: tests[2]}, {user: users[1], test: tests[3]}])


