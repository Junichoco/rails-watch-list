class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  # validates :list, presence: true, uniqueness: { :movie }
  validates_uniqueness_of :movie, scope: :list
  # add_index :bookmarks, [:movie, :list], unique: true
end
