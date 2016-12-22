get '/session-viewer' do
     session.inspect
end

get '/login' do
  erb :'/sessions'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user.password = params[:hashed_password]
    login(@user)
    redirect"/users/#{session[:user_id]}"
  else
    erb :'/sessions'
  end
end

delete '/logout' do
  logout
  redirect '/'
end