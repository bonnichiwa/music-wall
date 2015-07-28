# Homepage (Root path)
enable :sessions

before '/*' do
  unless request.path == '/' || 
    request.path == '/login' || 
    request.path == '/signup/new' ||
    request.path == '/verify' 
    if !session[:username]
      redirect '/login'
    end
  end
end

get '/' do
  if session[:username]
    redirect '/songs'
  else
    erb :index
  end
end

get '/songs' do
  @songs = Song.select('songs.*, COUNT(likes.id)').joins('LEFT JOIN likes ON songs.id = likes.song_id GROUP BY songs.id ORDER BY COUNT(likes.id) DESC')
  erb :'songs/index'
end

get '/songs/new' do
  erb :'songs/new'
end

get '/songs/:song_id' do
  @song = Song.find(params[:song_id])
  @reviews = @song.reviews
  @new_review = Review.new
  erb :'songs/show'
end

post '/review' do
  @new_review = Review.new(
    song_id: params[:song_id],
    username: session[:username],
    note: params[:note]
    )
  if @new_review.save
    redirect "/songs/#{@new_review.song_id}"
  end
end

post '/review/delete' do
  @delete_review = Review.find(params[:review_id])
  @delete_review.destroy
  redirect "/songs/#{@delete_review.song_id}"
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

get "/logout" do
  session[:username] = nil
  redirect '/login'
end

post '/verify' do
  if User.verify(params[:username], params[:password])
    session[:username] = params[:username]
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
    url:  params[:url],
    created_by_user: session[:username]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

post '/like' do 
  @like = Like.new(username: session[:username], song_id: params[:song_id])
  if @like.save
    redirect '/songs'
  end
end


