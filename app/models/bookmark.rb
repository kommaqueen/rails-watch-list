class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  # the [movie, list] pairings should be unique
  validates_uniqueness_of :movie, scope: :list_id
end
