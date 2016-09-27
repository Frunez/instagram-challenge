class Image < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, length: { minimum: 1 }
end
