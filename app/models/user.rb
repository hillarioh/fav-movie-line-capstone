class User < ApplicationRecord
  after_commit :add_default_profile, on: [:create, :update]
  after_commit :add_default_cover, on: [:create, :update]


  has_many :lines, foreign_key: 'author_id', class_name: 'Line'
  has_one_attached :profile_pic
  has_one_attached :cover_pic

  has_many :followers, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followings, class_name: 'Following', foreign_key: 'follower_id'

  validates_presence_of :username
  validates_presence_of :fullname
  
  private 
  def add_default_profile
    unless profile_pic.attached?
      self.profile_pic.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-prof.png")), filename: 'default-prof.png' , content_type: "image/png")
    end
  end

  def add_default_cover
    unless cover_pic.attached?
      self.cover_pic.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-cover2.jpg")), filename: 'default-cover2.jpg' , content_type: "image/jpg")
    end
  end

 
end
