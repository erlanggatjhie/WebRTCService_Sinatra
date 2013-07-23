get '/session_information/index' do
  @infos = SessionInformation.all
  slim :'session_information/index'
end

get '/session_information/:name' do
  info = SessionInformation.find(:name => params[:name])
  info.value
end

post '/session_information' do
  name = params[:name] || ""
  value = params[:value]

  unless name.empty?
    info = SessionInformation.new
    info.name = name.strip.gsub " ", "_"
    info.value = value
    info.save
  end

  redirect '/session_information/index'
end
