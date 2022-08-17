class Review < ApplicationRecord
  belongs_to :restaurant

  validates :rating, :content, presence: true
  validates :rating, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0, less_than: 6 }

end
