class List < ApplicationRecord
  # When you delete a list, you should delete all dependent bookmarks
  # otherwise if you try to delete a list, you can't because there are other
  # models (movies) attached to it
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates :name, uniqueness: true, presence: true
end
