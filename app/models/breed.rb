class Breed < ApplicationRecord
  #TODO: has_many :pets

  validates :name, presence: true, uniqueness: true
end
