get '/' do
  @grandma = params[:grandma]
  # Look in app/views/index.erb
  erb :index
end

post '/grandma' do
  "Implement the /grandma route yourself.<br>Params: <code>#{params.inspect}</code>"
end
