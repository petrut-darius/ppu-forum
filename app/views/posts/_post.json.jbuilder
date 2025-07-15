json.extract! post, :id, :question, :description_of_question, :created_at, :updated_at
json.url post_url(post, format: :json)
