json.array!(@comments) do |comment|
  json.text comment.text
  json.author_name comment.author.name
end
