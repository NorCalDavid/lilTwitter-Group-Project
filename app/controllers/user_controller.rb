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
  @user.password = params[:password]

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

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
