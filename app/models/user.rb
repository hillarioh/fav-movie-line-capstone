class User < ApplicationRecord

    validates_presence_of :username
    validates_presence_of :fullname
end
