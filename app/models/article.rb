class Article < ApplicationRecord
  validates :title, presence: true
  validates_length_of :title, minimum: 3, maximum: 20
  validates_length_of :body, minimum: 3, maximum: 200
  validates :body, presence: true
  has_many :comments, dependent: :destroy
end
