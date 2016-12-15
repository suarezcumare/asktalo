json.array!(@question_labels) do |question_label|
  json.extract! question_label, :id, :question_id, :label_id
  json.url question_label_url(question_label, format: :json)
end
