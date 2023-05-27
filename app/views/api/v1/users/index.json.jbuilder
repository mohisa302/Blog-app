json.array!(@posts) do |post|
  json.title post.title
  json.text post.text
  json.comments_count post.comments_counter
  json.likes_count post.likes_counter
end
