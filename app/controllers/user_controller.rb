###########################################
### User Controller
###########################################

get '/' do
  # for signup or login
  @user = User.new
  erb :index
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
 end

post '/users/new' do
  @user = User.new
  @user.name = params[:name]
  @user.password = params[:password_hash]

  p "*"*100
p params
  if @user.save
    #helper method
    auth_login(@user)
    redirect "/users/#{@user.id}"
  else
    @form_error = 'Unable to register'
    erb :'users/new'
  end
end

# once you're in
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

# find this user, check password, and login (redirect)

post '/users' do
  #if user input = password in db
    @name = params[:name]
    @user_id = params[:id]
  @user = User.find_by(id: @user_id)

  if(@user && @user.password == params[:password_hash])
    auth_login(@user)
    # flash[:message] = 'Thank you for logging in'
    redirect "/users/#{@user_id}"
  else
    # @form_error = 'Unable to log you in'
    redirect '/'
  end
end


get '/logout' do
  auth_logout
  redirect '/'
end
