require 'debugger'
get '/create_survey' do 
  # @user_id = session[:user_id]
  erb :create_survey
end

post '/create_survey' do 
  # author will be User.find(session[:user_id])
  # user = User.find(session[:user_id])
  p params
  p'#################################'
  p'#################################'
  p'#################################'
  p'#################################'
  p'#################################'
  p'#################################'
  survey = Survey.new(title: params[:title], author_id: session[:user_id])
  write_survey(survey)
 redirect '/'
end
