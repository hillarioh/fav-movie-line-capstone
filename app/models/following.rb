class Following < ApplicationRecord

    belongs_to :followed,class_name: 'User'
    belongs_to :follower,class_name: 'User'

    validates_presence_of :followed_id
    validates_presence_of :follower_id

    scope :has_followed, ->(u,c) { where(followed: u,follower: c) }

    
end
