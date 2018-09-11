# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create!([{ title: 'frontend' }, { title: 'backend' }, { title: 'mobile development' }])
tests = Test.create!([{ title: 'HTML', level: 1, category: categories.first }, { title: 'Ruby', level: 3, category: categories.third }, { title: 'CSS', level: 2, category: categories.first }, { title: 'C#', level: 3, category: categories.second}, { title: 'Java', level: 1, category: categories.second }])
questions = Question.create!([{ body: 'Question HTML?', test: tests.first }, { body: 'Question Ruby?', test: tests.second }, { body: 'Question CSS?', test: tests.third }, { body: 'Question C#?', test: tests.fourth }, { body: 'Question Java?', test: tests.fifth }])
answers = Answer.create!([{ body: 'Answer HTML', correct: true, question: questions.first }, { body: 'Answer Ruby', correct: true, question: questions.second }, { body: 'Answer CSS', correct: false, question: questions.third  }, { body: 'Answer C#', correct: true, question: questions.fourth }, { body: 'Answer Java', correct: false, question: questions.fifth }])
users = User.create!([{first_name: 'Ivan', last_name: 'Ivanov'}, {first_name: 'Peter', last_name: 'Petrov'}])

TestUser.create!([{user: users.first, test: tests.first}, {user: users.first, test: tests.second}, {user: users.second, test: tests.third}, {user: users.second, test: tests.fourth}])


