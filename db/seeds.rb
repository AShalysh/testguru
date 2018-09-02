# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([{ title: 'frontend' }, { title: 'backend' }, { title: 'mobile development' }])
tests = Test.create([{ title: 'HTML', level: 1, category_id: 1, user_id: 1 }, { title: 'Ruby', level: 3, category_id: 3, user_id: 2 }, { title: 'CSS', level: 2, category_id: 1, user_id: 1 }, { title: 'C#', level: 3, category_id: 2, user_id: 2 }, { title: 'Java', level: 1, category_id: 2, user_id: 1 }])
questions = Question.create([{ body: 'Question HTML?', test_id: 1 }, { body: 'Question Ruby?', test_id: 2 }, { body: 'Question CSS?', test_id: 3 }, { body: 'Question C#?', test_id: 4 }, { body: 'Question Java?', test_id: 5 }])
answers = Answer.create([{ body: 'Answer HTML', correct: true, question_id: 1 }, { body: 'Answer Ruby', correct: true, question_id: 2 }, { body: 'Answer CSS', correct: false, question_id: 3 }, { body: 'Answer C#', correct: true, question_id: 4 }, { body: 'Answer Java', correct: false, question_id: 5 }])
users = User.create([{first_name: 'Ivan', last_name: 'Ivanov'}, {first_name: 'Peter', last_name: 'Petrov'}])
