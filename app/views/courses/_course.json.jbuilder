json.extract! course, :id, :name, :description, :objective, :reason_why, :created_at, :updated_at
json.url course_url(course, format: :json)
