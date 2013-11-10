get '/chris_stats/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  # @surveys = SurveyTaker.where('survey_id = ?', params[:survey_id])
  @questions = @survey
  erb :statistics
end
