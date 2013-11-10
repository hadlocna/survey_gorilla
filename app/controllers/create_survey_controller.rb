require 'debugger'

get '/create_survey' do 
  if logged_in?
    # @user_id = session[:user_id]
    erb :create_survey
  else
    redirect '/login'
  end
end

post '/create_survey' do 
  # author will be User.find(session[:user_id])
  # user = User.find(session[:user_id])
  survey = Survey.create(title: params[:title])
  # user.authored_surveys << survey
  params.delete_if {|k, v| k =='title'}
  params.each do |name, value|
    # select questions by name, then write Question.create(text: value)
    # If the input name starts with question
    if name[0,8] == 'question'
      #The create new question
      question = Question.create(text: "#{value}")
      # Go through all the params again
      params.each do |k, choice|
        # DOUBLE DIGIT
        # question1.length > 9, e.g. question10
        if name.length > 9
           if k[1, 2] == name[8, 2]
            question.choices.create(text: "#{choice}")
          end
        # If the second character of the key matches the last character of question name
        # SINGLE DIGIT
        # q1choice2'.length == 9
        elsif k.length == 9
          # k[1] means select the 1 of q1choice2 (second character)
          # name[8] means select the 1 of question1 
          if k[1] == name[8]
          #Then create a choice, and shovel into that respective question
            question.choices.create(text: "#{choice}")
          end
        end
      end
      # Then put the question into the respective survey
      survey.questions << question
    end
  end
  # survey title will be params[:title]
  # takes a bunch of questions associated choices and writes a new survay to the db
  #questions will come in as params[:question(i)], choices in as params[:q(i)choice(j)]
  redirect '/'

end
