class Line < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates_presence_of :text
  validates_presence_of :movie_title

  scope :my_lines, ->(c) { where(author: c) }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
