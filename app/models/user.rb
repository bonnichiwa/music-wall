class User < ActiveRecord::Base
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  def self.verify(username, password)
    login = User.find_by(username: username)
    if !login.nil?
      login.password == password
    else
      false
    end
  end

end