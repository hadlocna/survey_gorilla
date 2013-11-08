enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do

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

  erb :statistics
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/survey' do

  erb :survey
end

get '/survey/:survey_id' do

  erb :take_survey
end

post '/survey/:survey_id' do
  submit_survey
  # params.inspect
  redirect "/statistics/#{current_survey.id}"
end

get '/statistics/:survey_id' do
  # params.inspect
  erb :statistics
end
