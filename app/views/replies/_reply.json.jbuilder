json.extract! reply, :id, :comment, :subject_id, :created_at, :updated_at
json.url reply_url(reply, format: :json)