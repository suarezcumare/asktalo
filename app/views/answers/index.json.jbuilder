json.array!(@answers) do |answer|
  json.extract! answer, :id, :description
  json.url answer_url(answer, format: :json)
end
