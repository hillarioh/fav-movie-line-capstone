class Line < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates_presence_of :text

  scope :my_lines, ->(c) { where(author: c) }
end
