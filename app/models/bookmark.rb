class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, presence: true, length: { minimum: 6 }
  validates_associated :movie, :list
  validates :movie_id, uniqueness: { scope: :list_id }
  has_many_attached :photos
end
