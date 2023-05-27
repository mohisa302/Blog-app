json.array!(@user.posts) do |post|
  json.title post.title
  json.text post.text
end
