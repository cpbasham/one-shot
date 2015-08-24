def auth_logged_in?
  !session[:user_id].nil?
end

def auth_login(user)
  session[:user_id] = user.id
end

def auth_logout
  session.destroy
end

def auth_current_user
  return nil unless auth_logged_in?
  @current_user ||= User.find(session[:user_id])
end