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
  survey = Survey.new(title: params[:title], author_id: session[:id])
  write_survey(survey)
 redirect '/'
end
