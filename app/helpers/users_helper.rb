def current_user
  User.find_by_id(session[:id])
end

def login_user
  @user = User.find_by_email(params[:email])
  if @user
    if @user.password == params[:password]
      #give token
      session[:id] = @user.id
      session[:login_error] = nil
    else
      session[:login_error] = "Email and password combination not found"
    end
  else
    session[:login_error] = "User not found"
  end
end

# def login_user(email, password)
#   user = User.authenticate(email, password)
#   if user
#     session[:id] = user.id
#     session[:login_error] = nil
#   else
#     session[:login_error] = "Email and password combination not found"
#   end
# end

def signup_user
  @user = User.new(params[:user])
  @user.password = params[:password]
  @user.save!
  if @user.valid?
    session[:id] = @user.id
    session[:signup_error] = nil
  else
    session[:signup_error] = "Sign up failed!  Please try again."
  end
end
