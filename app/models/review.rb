class Review < ActiveRecord::Base
  validates :username, presence: true
  validates :note, presence: true

  belongs_to :user, foreign_key: "user_id"
  belongs_to :song, foreign_key: "song_id"

  def to_s
  end

end