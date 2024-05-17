class Pet < ApplicationRecord
  belongs_to :owner, optional: true

  validates :weight, numericality: { greater_than_or_equal_to: 0 }
end
