class User < ApplicationRecord

    has_many :lines, foreign_key: 'author_id', class_name: 'Line'
    has_one_attached :profile_pic
    has_one_attached :cover_pic

    has_many :followings
    has_many :followers, class_name: 'Following', foreign_key: 'follower_id'

    validates_presence_of :username
    validates_presence_of :fullname
end
