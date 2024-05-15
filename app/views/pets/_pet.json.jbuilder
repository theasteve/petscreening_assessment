json.extract! pet, :id, :name, :kind, :breed, :created_at, :updated_at
json.url pet_url(pet, format: :json)
