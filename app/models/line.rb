class Line < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates_presence_of :text
end
