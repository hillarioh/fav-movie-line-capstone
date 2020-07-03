module UsersHelper

    def check_status(user)
        Following.has_followed(user,current_user).count.positive? ? false : true       
    end
end
