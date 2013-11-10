require 'debugger'

get '/create_survey' do
  if logged_in?
    erb :create_survey
  else
    redirect '/login'
  end
end

post '/create_survey' do
  if params[:title] != '' && params[:question1] != ''
    survey = Survey.new(title: params[:title], author_id: session[:id])
    write_survey(survey)
    redirect '/'
  else
    redirect '/create_survey'
 end
end
