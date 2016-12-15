json.array!(@labels) do |label|
  json.extract! label, :id, :name, :description, :available
  json.url label_url(label, format: :json)
end
