class FollowingsController < ApplicationController
    def new
        
    end

    def create

        @following = Following.new(following_params)

        if @following.save
            flash[:success] = 'You followed ' + User.find(@following.followed_id).username
            redirect_to users_path
          else
            flash[:error] = 'Something went wrong'
            redirect_to users_path, alert: 'Not successful.'
          end

        
    end

    private
    
      def following_params
        params.permit(:followed_id,:follower_id)
      end


end
