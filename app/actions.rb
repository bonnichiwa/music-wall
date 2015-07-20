# Homepage (Root path)
get '/' do
  erb :'songs/index'
end

get '/songs' do
  'Song list here'
end

