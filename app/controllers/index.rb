get '/' do 
  if session['user']
    @user = User.find(session[:user])
  end
    erb :'index'
end