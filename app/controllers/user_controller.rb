get '/profile' do
  redirect '/' unless auth_logged_in?
  @user = auth_current_user
  erb :'users/profile'
end

get '/login' do
  @user = User.new
  erb :'users/login_register'
end

post '/login' do
  @login = params[:login]
  user = User.find_by(login: @login)

  if (user && user.password == params[:password])
    auth_login(user)
    flash[:message] = 'Thank you for logging in'
    redirect '/profile'
  else
    @login_form_error = 'Unable to log you in'
    @user = User.new
    erb :'users/login_register'
  end
end

post '/register' do
  @user = User.new
  @user.login = params[:login]
  @user.password = params[:password]

  if @user.save
    auth_login(@user)
    flash[:message] = 'Thank you for registering'
    redirect '/'
  else
    @register_form_error = 'Unable to register you'
    erb :'users/login_register'
  end
end

get '/logout' do
  auth_logout
  redirect '/'
end