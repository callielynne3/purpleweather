get '/users/new' do 
  erb :'users/new'
end 

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user
    redirect "/users/#{@user.id}"
  else 
    @errors = ["Username or Email already exists"]
    redirect 'users/new'
  end
end

get '/users/:id' do 
  @user = User.find(params[:id])
  p current_user
  p session[:user_id]
  redirect '/sessions/new' unless current_user
  erb :'/users/show'
end

get '/users/:id/edit' do 
  @user = User.find(params[:id])
  erb :'users/edit'
end 

put '/users/:id' do
  @user = User.find(params[:id])
  if params[:password] == ""
    @user.assign_attributes(email: params[:email], password: @user.password)
  else
    @user.assign_attributes(email: params[:email], password: params[:password])
  end
  redirect "/users/#{@user.id}"
end


delete '/users/:id' do
  @user = User.find(params[:id])
  @user.destroy 
  redirect '/' 
end