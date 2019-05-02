json.extract! task, :id, :name, :deadline, :detail, :time, :created_at, :updated_at
json.url task_url(task, format: :json)
