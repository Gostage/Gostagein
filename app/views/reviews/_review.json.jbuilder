json.extract! review, :id, :title, :notation, :description, :internship_id, :created_at, :updated_at
json.url review_url(review, format: :json)
