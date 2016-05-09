json.array!(@taks) do |tak|
  json.extract! tak, :id, :name, :complete
  json.url tak_url(tak, format: :json)
end
