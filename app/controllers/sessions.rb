get '/sessions/new' do
  erb :'/users/login.html'
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    @current_user = @user.id
    redirect "/users/#{@user.id}"
  else 
    @errors = ["Email or password did not match."]
    erb :'users/login.html'
  end
end

delete '/sessions' do
  log_out if logged_in?
  redirect '/'
end