###########################################
### Follower Controller
###########################################


get '/test' do
  @user = auth_current_user
  erb :'relationships/_stats'
end
