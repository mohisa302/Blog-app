# require 'application_system_test_case'

# class PostShowTest < ApplicationSystemTestCase
#   test 'viewing post show page' do
#     post = posts(:post1_user1)

#     visit post_path(post)

#     # Test for post's title, author, comments, likes and body.
#     assert_text post.title
#     assert_text post.user.username
#     assert_text "#{post.comments.count} comments"
#     assert_text "#{post.likes.count} likes"
#     assert_text post.body

#     # Test for username of each commentor and the comment itself.
#     post.comments.each do |comment|
#       assert_selector ".comment-username", text: comment.user.username
#       assert_selector ".comment-body", text: comment.body
#     end
#   end
# end
