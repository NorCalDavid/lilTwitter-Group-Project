###########################################
### Tweet Controller
###########################################

# get '/users/:user_id' do

#   @user = User.find(params[:user_id])
#   erb :"tweets/new"
# end

post '/users/:user_id/tweets/new' do

  @user = User.find(params[:user_id])
  @tweet = Tweet.create(message: params[:message], user_id: params[:user_id])
  @allTweets = Tweet.all
  redirect "/users/#{@user.id}"
end

# <<<<<<< HEAD
# get '/users/:user_id/tweets/show' do

#   @tweets = Tweet.where(user_id: params[:user_id])

#   erb :"tweets/show"
# end

# get '/users/:user_id/tweets/:tweet_id/edit' do
#    # @user = User.find(params[:user_id])
# =======

# get '/users/:user_id' do
#   @user = User.find(params[:user_id])
#   @tweets = Tweet.where(user_id: params[:user_id])

#   erb :"tweets/show"
# end


get '/users/:user_id/tweets/edit' do
    @user = User.find(params[:user_id])
    @tweets = Tweet.where(user_id: @user.id)
   erb :"tweets/edit"
end

put '/users/:user_id/tweets/:tweet_id' do
  @user= User.find(params[:user_id])
  @tweet = Tweet.find(params[:tweet_id]).update_attributes(message: params[:message])
  redirect "/users/#{@user.id}"
end

delete '/users/:user_id/tweets/:tweet_id'do
  @user= User.find(params[:user_id])
  tweet = Tweet.find(params[:tweet_id])
  tweet.destroy
  redirect "/users/#{@user.id}"
end

