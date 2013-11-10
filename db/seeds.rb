require 'faker'

user = User.new(name: 'fred', email: 'fred@dbc.com')
user.password = '123'
user.save!
wilma = User.new(name: 'wilma', email: 'wilma@dbc.com')
wilma.password = '123'
wilma.save!

survey = user.authored_surveys.create(title: 'how many salamanders in a maelstrom')
survey.survey_takers.create(user_id: 2)
q = survey.questions.create(text: 'how many?')

# choice = q.choices.create(text: '1')
q.choices.create(text: '2')
q.choices.create(text: '3')
q.choices.create(text: '5')
q.choices.create(text: '47')

# choice.responses.create(survey_taker_id: 1)

q2 = survey.questions.create(text: 'how much?')
q2.choices.create(text: '22')
q2.choices.create(text: '2')
q2.choices.create(text: '6')
q2.choices.create(text: '9')
q2.choices.create(text: '27')



10.times do |i|
  u = User.new(name: Faker::Name.first_name, email: Faker::Internet.email)
  u.password = '123'
  u.save!
end

10.times do |i|
  s = Survey.new(title: Faker::Lorem.word)
  User.all.sample.authored_surveys << s
  5.times do |j|
    q = Question.new(text: Faker::Lorem.word)
    4.times do |k|
      q.choices.new(text: Faker::Lorem.word)
    end
    s.questions << q
  end
  s.save!
end
