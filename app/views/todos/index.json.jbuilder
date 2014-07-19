json.array!(@todos) do |todo|
  json.extract! todo, :id, :name, :status
  json.url todo_url(todo, format: :json)
end
