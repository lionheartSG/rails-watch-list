class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :picture_url, presence: true
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_one_attached :photo
end
