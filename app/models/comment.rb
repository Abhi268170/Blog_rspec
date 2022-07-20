class Comment < ApplicationRecord
  validates :body, presence: true
  validates_length_of :body, minimum: 3, maximum: 200
  belongs_to :article
end
