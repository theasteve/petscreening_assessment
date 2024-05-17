require 'rails_helper'

RSpec.describe Owner, type: :model do
  it { should have_many(:pets).dependent(:destroy) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  it 'is valid with valid attributes' do
    owner = Owner.new(
      first_name: 'John',
      last_name: 'Lewis',
      email: 'john@example.com'
    )

    expect(owner).to be_valid
  end

   it 'is invalid without a first name' do
    owner = Owner.new(
      first_name: nil,
      last_name: 'Doe',
      email: 'john.doe@example.com'
    )
    expect(owner).not_to be_valid
  end

  it 'is invalid without a last name' do
    owner = Owner.new(
      first_name: 'John',
      last_name: nil,
      email: 'john.doe@example.com'
    )
    expect(owner).not_to be_valid
  end

  it 'is invalid without an email' do
    owner = Owner.new(
      first_name: 'John',
      last_name: 'Doe',
      email: nil
    )
    expect(owner).not_to be_valid
  end

  it 'is invalid with a duplicate email' do
    Owner.create(
      first_name: 'Jane',
      last_name: 'Doe',
      email: 'jane.doe@example.com'
    )
    owner = Owner.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'jane.doe@example.com'
    )
    expect(owner).not_to be_valid
  end
end
