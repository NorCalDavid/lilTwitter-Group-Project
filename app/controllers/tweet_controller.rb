###########################################
### Tweet Controller
###########################################

get '/users/:id/tweets/new' do

  erb :"tweets/new"
end

post '/users/:user_id/tweets/new' do

  @tweet = Tweet.create(comment: params[:comment], user_id: params[:user_id])
  redirect '/users/:user_id/tweets/:tweet_id/edit'
end

get '/users/:user_id/tweets/:tweet_id/edit' do

end

