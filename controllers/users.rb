get 'users' do 
  @users = User.all
  erb :index
end 

get'/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email],hashed_password: params[:hashed_password])
  @user.password = params[:password]

  if @user.save
    login(@user)
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    redirect '/users/new'
  end
end

get'/users/:id' do
  if params[:id].to_i == current_user.id
    @user = User.find(params[:id])
    erb :'users/show'
  else
    redirect "users/#{current_user.id}"
  end
end


get '/users/:id/edit' do
  @user = User.find(params[:id]) 
  erb :'users/edit'
end


put '/users/:id' do
  @user = User.find(params[:id])
  @user.assign_attributes(first_name: params[:first_name])
  if @user.save 
    redirect '/users/:id'
  else
    erb :'users/edit'
  end
end


delete '/users/:id' do
  @user = User.find(params[:id])
  logout
  @user.destroy
  redirect '/'
end
