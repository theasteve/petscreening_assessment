# spec/models/pet_spec.rb
require 'rails_helper'

RSpec.describe Pet, type: :model do
  it "is valid with a non-negative weight" do
    pet = Pet.new(name: "Buddy", kind: "Dog", breed: "Golden Retriever", weight: 50)
    expect(pet).to be_valid
  end

  it "is invalid with a negative weight" do
    pet = Pet.new(name: "Buddy", kind: "Dog", breed: "Golden Retriever", weight: -1)
    expect(pet).not_to be_valid
    expect(pet.errors[:weight]).to include("must be greater than or equal to 0")
  end

  it "is valid with a zero weight" do
    pet = Pet.new(name: "Buddy", kind: "Dog", breed: "Golden Retriever", weight: 0)
    expect(pet).to be_valid
  end

  it "is invalid with a non-integer weight" do
    pet = Pet.new(name: "Buddy", kind: "Dog", breed: "Golden Retriever", weight: "heavy")
    expect(pet).not_to be_valid
    expect(pet.errors[:weight]).to include("is not a number")
  end
end

