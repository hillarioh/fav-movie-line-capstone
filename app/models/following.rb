class Following < ApplicationRecord

    belongs_to :followed,class_name: 'User'
    belongs_to :follower,class_name: 'User'

    scope :has_followed, ->(u,c) { where(followed: u,follower: c) }

    
end
