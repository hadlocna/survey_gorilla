def current_user
  User.find_by_id(session[:id])
end

def login_user(email, password)
  user = User.authenticate(email, password)
  if user
    session[:id] = user.id
    session[:login_error] = nil
  else
    session[:login_error] = "Email and password combination not found"
  end
end

def signup_user(name, email, password)
  user = User.create(name: name, email: email, password: password)
  if user.valid?
    session[:id] = user.id
    session[:signup_error] = nil
  else
    session[:signup_error] = "Sign up failed!  Please try again."
  end
end