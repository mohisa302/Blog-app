# require 'application_system_test_case'

# class UserShowTest < ApplicationSystemTestCase
#   test 'viewing user show page' do
#     user = users(:user1)
#     post1 = posts(:post1_user1)
#     post2 = posts(:post2_user1)
    
#     visit user_path(user)

#     # Test for user's profile picture, username, bio.
#     assert_selector '.user-avatar'
#     assert_text user.username
#     assert_text user.bio
    
#     # Test for number of posts the user has written and first 3 posts.
#     assert_text "#{user.posts.count} posts"
#     assert_text post1.title
#     assert_text post2.title
    
#     # Test for button that lets me view all of a user's posts.
#     click_on 'View All Posts'
#     assert_current_path user_posts_path(user)

#     # Test for redirect to post show page when clicking on a post.
#     click_on post1.title
#     assert_current_path post_path(post1)
#   end
# end
