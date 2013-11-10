helpers do

  def current_survey
    Survey.find(params[:survey_id])
  end

  def submit_survey
    survey_taker = current_survey.survey_takers.create(user_id: session[:id])
    counter = 1
    current_survey.questions.length.times do
      survey_taker.responses.create(choice_id: params["#{counter}"])
      counter += 1
    end
  end

  def choice_percentage(choice)
    matches = Response.where(choice_id: choice.id).count
    total_responses = current_survey.survey_takers.count
    return 0 if matches == 0
    percent = (matches.to_f / total_responses * 100).round()
  end
end
