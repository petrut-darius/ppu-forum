json.extract! subforum, :id, :title, :description, :created_at, :updated_at
json.url subforum_url(subforum, format: :json)
