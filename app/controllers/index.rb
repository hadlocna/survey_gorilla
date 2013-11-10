# enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do
  session[:login_error] = nil
  erb :login
end

post '/login' do
  # login_user(params[:email], params[:password])
  login_user
  if session[:login_error]
    erb :login
  else
    redirect '/'
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  signup_user
  if session[:signup_error]
    erb :signup
  else
    redirect '/'
  end
end

get '/statistics' do
  if logged_in?
    erb :stats_menu
  else
    redirect '/login'
  end
end


get '/logout' do
  session.clear
  redirect '/'
end

get '/survey' do
  if logged_in?
    erb :survey
  else
    redirect '/login'
  end
end

get '/survey/:survey_id' do
  if logged_in?
    erb :take_survey
  else
    redirect '/login'
  end
end

post '/survey/:survey_id' do
  submit_survey
  # params.inspect
  redirect "/statistics/#{current_survey.id}"
end

get '/statistics/:survey_id' do
  # params.inspect
  if logged_in?
    erb :statistics
  else
    redirect '/login'
  end
end


# get '/completed_surveys' do
#   # @taken_surveys = test  ## => this association is broken
#   # redirect '/' unless completed_survey_ids.length < 0
#     @completed_surveys = completed_survey_ids().map { |s_id| Survey.find(s_id) }
#     erb :completed_surveys
# end

