json.array!(@post.comments) do |comment|
  json.text comment.text
end
