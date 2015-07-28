class AddUserId < ActiveRecord::Migration
  def change
    add_column :songs, :created_by_user, :string
  end
end
