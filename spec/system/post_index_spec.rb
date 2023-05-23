# require 'application_system_test_case'

# class UserPostsTest < ApplicationSystemTestCase
#   test 'viewing user post index page' do
#     user = users(:user1)
#     post1 = posts(:post1_user1)
#     post2 = posts(:post2_user1)

#     visit user_posts_path(user)

#     # Test for user's profile picture, username, bio.
#     assert_selector '.user-avatar'
#     assert_text user.username
#     assert_text "#{user.posts.count} posts"

#     # Test for post's title, body, comments, likes and pagination.
#     assert_text post1.title
#     assert_text post1.body
#     assert_text "2 comments"
#     assert_text "5 likes"

#     assert_text post2.title
#     assert_text post2.body
#     assert_text "0 comments"
#     assert_text "3 likes"

#     assert_selector ".pagination", visible: true

#     # Test for redirect to post show page when clicking on a post.
#     click_on post1.title
#     assert_current_path post_path(post1)
#   end
# end
