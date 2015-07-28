class User < ActiveRecord::Base
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :songs
  has_many :likes
  has_many :reviews

  def self.verify(username, password)
    login = User.find_by(username: username)
    if !login.nil?
      login.password == password
    else
      false
    end
  end

end