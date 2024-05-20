# PetScreening Assessment

## Installation

1. Install the required gems:
    ```bash
    bundle install
    ```

2. Run the tests:
    ```bash
    rspec spec/models
    ```

3. Run the rake task to retrieve Breed records from dogapi.dog:
    ```bash
    rails db:seed_breeds
    ```

## Requirements

### Create an Owner Record from the Console

1. Open the Rails console:
    ```bash
    rails console
    ```

2. Create an owner record:
    ```ruby
    owner = Owner.create!(
      first_name: 'Steven',
      last_name: 'Aguilar',
      phone_number: '(347)341-0000',
      email: 'stevenaguilarcs@gmail.com'
    )
    ```

### Check the Association that an Owner Can Have Many Pets

1. Open the Rails console:
    ```bash
    rails console
    ```

2. Retrieve the last two pets and associate them with the newly created owner:
    ```ruby
    pets = Pet.last(2)
    pets.each { |pet| pet.update(owner: owner) }
    ```

3. Verify the association:
    ```ruby
    owner.pets
    ```

## New API Requirement

There was a bit of ambiguity with the requirement which was a fun experience. The interpretations and decisions I made with the New API requirement are as follows:

- Store the data in our internal database.
- Create a rake task that makes a request to dogapi.dog.
- Create a Breed table because multiple pets can be of the same breed. Breed data is specific to the domain breed, not to a pet, thus avoiding data redundancy.

## Time Constraint

With more time, I would have improved observability. I would have also updated the form with a dropdown to select the breed. Although there is a constraint for this being only for dogs, that would need to be taken into consideration. Additionally, the new Breed table requires some editing since there is already a breed string field.

## Experience

I really enjoyed working on this project. It was really fun to work with the dogapi.dog. I'm really looking forward to being part of your team.
