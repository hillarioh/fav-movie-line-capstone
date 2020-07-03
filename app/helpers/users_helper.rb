module UsersHelper

    def check_status(user)
        Following.has_followed(user,current_user).count.positive? ? false : true       
    end

    def user_followers(id)
        followers = User.includes(:followings).where(followings: {followed_id: id})
        return followers
    end

    def user_followings(id)
        followings = User.includes(:followers).where(followings: {follower_id: id})
        return followings
    end

end
