get '/users' do 
  @users = User.all 
  erb :'users/index'
end 

# show registration form 
get '/users/new' do 
  erb :'users/new'
end 

get '/users/:id/edit' do 
  @user = User.find(params[:id])
  erb :'users/edit'
end 

get '/users/:id' do 
  @user = User.find(params[:id])
  redirect '/sessions/new' unless current_user
  redirect '/questions' unless logged_in?
  erb :'/users/show'
end

#post registration form
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user] = @user
    redirect "/users/#{@user.id}"
  else 
    @errors = ["Username or Email already exists"]
    redirect 'users/new'
  end
end


get '/users/:id/edit' do
  @user = User.find(params[:id]) 
  erb :'users/edit' 
end


put '/users/:id' do
  @user = User.find(params[:id])
  if params[:password] == ""
    @user.update(email: params[:email], password: @user.password)
  else
    @user.update(email: params[:email], password: params[:password])
  end
  redirect "/users/#{@user.id}"
end


delete '/users/:id' do
  @user = User.find(params[:id]) #
  @user.destroy 
  redirect '/users' 
end


