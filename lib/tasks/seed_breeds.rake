require 'net/http'
require 'json'

namespace :db do
  desc 'Seed breeds from Dog API'
  task seed_breeds: :environment do

    url = 'https://dogapi.dog/api/v2/breeds'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    breeds = JSON.parse(response)['data']

    breeds.each do |breed|
      attributes = breed['attributes']
      Breed.find_or_create_by!(
        name: attributes['name'],
        description: attributes['description'],
        min_life: attributes['life']['min'],
        max_life: attributes['life']['max'],
        hypoallergenic: attributes['hypoallergenic']
      )
    end
  end
end
