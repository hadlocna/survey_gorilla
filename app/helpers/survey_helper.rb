def current_survey
  Survey.find(params[:survey_id])
end

def submit_survey
  survey_taker = current_survey.survey_takers.create(user_id: session[:id])
  question = 1
  current_survey.questions.length.times do
    survey_taker.responses.create(choice_id: params["#{question}"])
    question += 1
  end
end