###########################################
### User Controller
###########################################

get '/' do
  # for signup or login
  @user = User.new
  erb :index
end

get '/user/new' do
  @user = User.new
  erb :'users/signup'
 end

post '/user/new' do
  @user = User.new
  @user.name = params[:name]
  @user.password = params[:password]

  if @user.save
    #helper method
    auth_login(@user)
    redirect "/user/#{ @user.id }"
  else
    @form_error = 'Unable to register'
    erb :'users/signup'
  end
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :'user/show'
end
