class Pet < ApplicationRecord
  belongs_to :owner
  validates :weight, numericality: { greater_than_or_equal_to: 0 }
end
