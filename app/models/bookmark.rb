class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # comment can be empty or min. 6 characters long
  validates :comment, length: { minimum: 6 }, allow_blank: true
  validates :movie, uniqueness: { scope: :list }
end
