class Like < ActiveRecord::Base

  belongs_to :song, foreign_key: "song_id"
  belongs_to :user, foreign_key: "user_id"

  def self.initialize(username, song_id)
    user_id = session[:username]
    song_id = params[:song_id]
  end


end