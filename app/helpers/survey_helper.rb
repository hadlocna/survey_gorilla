
require 'debugger'

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

  def completed_survey_ids
    completed_survey_ids = []
    SurveyTaker.where(user_id: session[:id]).each do |completed_survey|
      completed_survey_ids << completed_survey.survey_id
    end
    # debugger
    completed_survey_ids.uniq
  end
  # This is broken because of our associations
  # def testing_associations
  #   current_user.taken_surveys
  # end

  def write_survey(survey)
    # upload photo for survey
    if params['file']
      File.open('public/uploads/' + params['file'][:filename], "w") do |f|
        f.write(params['file'][:tempfile].read)
      end
      survey.photo = (params['file'][:filename])
    end
    params.delete_if {|k, v| k =='title'}
    params.delete_if {|k, v| k =='title'}
    # this leaves us with a params that is all q's and choices
    params.each do |name, value|
    # If the name starts with 'question'
    if name[0,8] == 'question'
      #Then create new question
      question = Question.new(text: "#{value}")
      # Go through all the params again, this time looking for choices
      params.each do |k, choice|
        # DOUBLE DIGIT Q, question__.length > 9, e.g. question10
        if name.length > 9
         if k[1, 2] == name[8, 2]
          # e.g. 'q12choice3' against 'question12'
          question.choices.new(text: "#{choice}")
        end
        # SINGLE DIGIT Q, 'q1choice2'.length == 9
      elsif k.length == 9
        if k[1] == name[8]
            # e.g. 'q3choice2' against 'question3'
            question.choices.new(text: "#{choice}")
          end
        end
      end
      # Then put the question, with choices now populated, into the survey
      survey.questions << question
    end
  end
  survey.save!
end
end
