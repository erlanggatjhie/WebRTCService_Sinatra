get '/users' do
  @users = User.all
  slim :'user/index'
end
