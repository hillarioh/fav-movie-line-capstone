class User < ApplicationRecord
  after_commit :add_default_profile, on: %i[create update]
  after_commit :add_default_cover, on: %i[create update]

  has_many :lines, foreign_key: 'author_id', class_name: 'Line'
  has_one_attached :profile_pic
  has_one_attached :cover_pic

  has_many :followers, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followings, class_name: 'Following', foreign_key: 'follower_id'

  validates_presence_of :username
  validates_presence_of :fullname
  # validates_presence_of :profile_pic
  # validates_presence_of :cover_pic

  private

  def add_default_profile
    return if profile_pic.attached?

    file = File.open(Rails.root.join('app', 'assets', 'images', 'default-prof.png'))
    profile_pic.attach(io: file, filename: 'default-prof.png', content_type: 'image/png')
  end

  def add_default_cover
    return cover_pic.attached?

    filed = File.open(Rails.root.join('app', 'assets', 'images', 'default-cover2.jpg'))
    cover_pic.attach(io: filed, filename: 'default-cover2.jpg', content_type: 'image/jpg')
  end
end
