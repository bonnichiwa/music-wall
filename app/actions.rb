# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  erb :'login/index'
  erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

get '/signup/new' do
  erb :'signup/new'
end

post '/signup/new' do
  @user = User.new(
    name: params[:name],
    username: params[:username],
    password: params[:password]
    )
  if @user.save
    redirect '/login'
  else
    erb :'signup/new'
  end
end

get '/login' do
  erb :'login/index'
end

post '/verify' do
  if User.verify(params[:username], params[:password])
    redirect '/songs'
  else 
    @error = "Login doesn't exist"
    erb :'login/index'
  end
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url:  params[:url]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

