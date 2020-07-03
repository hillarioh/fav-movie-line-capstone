module LinesHelper
    def list_to_follow
        following = User.includes(:followers).where(followings: {follower_id: current_user.id}).pluck(:id)
        following += [current_user.id]
        to_follow = User.where.not(id: following).limit(3)
        return to_follow
    end
end
