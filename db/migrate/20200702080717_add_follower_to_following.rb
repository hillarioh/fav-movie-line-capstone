class AddFollowerToFollowing < ActiveRecord::Migration[6.0]
  def change
      add_column :followings, :user_id, :integer
      add_column :followings, :follower_id, :integer
  end
end
