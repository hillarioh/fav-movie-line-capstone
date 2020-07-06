module UsersHelper
  def check_status(user)
    Following.has_followed(user, current_user).count.positive? ? false : true
  end

  def user_followers(id)
    followers = User.includes(:followings).where(followings: { followed_id: id })
    followers
  end

  def user_followings(id)
    followings = User.includes(:followers).where(followings: { follower_id: id })
    followings
  end

  def list_to_follow
    following = User.includes(:followers).where(followings: { follower_id: current_user.id }).pluck(:id)
    following += [current_user.id]
    to_follow = User.where.not(id: following).limit(3)
    to_follow
  end
end
