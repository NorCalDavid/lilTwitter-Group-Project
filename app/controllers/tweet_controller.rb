###########################################
### Tweet Controller
###########################################

get '/users/:user_id/tweets/new' do

  @user = User.find(params[:user_id])
  erb :"tweets/new"
end

post '/users/:user_id/tweets/new' do

  @user = User.find(params[:user_id])
  @tweet = Tweet.create(message: params[:message], user_id: params[:user_id])

  redirect "/users/#{@user.id}/tweets/#{@tweet.id}/edit"
end

get '/users/:user_id/tweets/:tweet_id/edit' do
   # @user = User.find(params[:user_id])

   erb :"tweets/edit"
end

post 'users/:user_id/tweets/:tweet_id/edit' do
  @tweet = Tweet.create(message: params[:message], user_id: params[:user_id])
  redirect '/users/:user_id/tweets/:tweet_id/edit'
end
