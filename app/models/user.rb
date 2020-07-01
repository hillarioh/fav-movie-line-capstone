class User < ApplicationRecord

    has_many :lines, foreign_key: 'author_id', class_name: 'Line'
    has_many_attached :images

    validates_presence_of :username
    validates_presence_of :fullname
end
