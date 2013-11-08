user = User.new(name: 'fred', email: 'fred@dbc.com')
user.password = '123'
user.save!
wilma = User.new(name: 'wilma', email: 'wilma@dbc.com')
wilma.password = '123'
wilma.save!

survey = user.authored_surveys.create(title: 'how many salamanders in a maelstrom')
survey.survey_takers.create(user_id: 2)
q = survey.questions.create(text: 'how many?')

choice = q.choices.create(text: '1')
q.choices.create(text: '2')
q.choices.create(text: '3')
q.choices.create(text: '5')
q.choices.create(text: '47')


choice.responses.create(survey_taker_id: 1)


q2 = survey.questions.create(text: 'how much?')
q2.choices.create(text: '22')
q2.choices.create(text: '2')
q2.choices.create(text: '6')
q2.choices.create(text: '9')
q2.choices.create(text: '27')
