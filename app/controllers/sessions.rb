# show login form 
get '/sessions/new' do
  erb :'/sessions/new'
end

# post login form 
post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    @current_user = @user.id
    redirect "/users/#{@user.id}"
  else 
    @errors = ["Email or password did not match."]
    erb :'sessions/new'
  end
end

delete '/sessions' do
  log_out if logged_in?
  redirect '/'
end