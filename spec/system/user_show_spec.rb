require 'rails_helper'

RSpec.describe 'User profile page', type: :feature do
  let!(:user) { User.create(username: 'johndoe', email: 'johndoe@example.com', password: 'password') }

  before do
    3.times { FactoryBot.create(:post, user: user) }
  end

  it 'displays user information and posts' do
    visit user_path(user)

    # Check that user information is displayed correctly
    expect(page).to have_css('img.user-avatar')
    expect(page).to have_content user.username
    expect(page).to have_content "Posts: #{user.posts.count}"
    expect(page).to have_content user.bio

    # Check that the first 3 posts are displayed and there's a button to view all posts
    within('.user-posts') do
      expect(page).to have_css('.post', count: 3)
      expect(page).to have_link('See all posts', href: user_posts_path(user))
    end

    # Click on a post title and verify that it redirects to the post show page
    post = user.posts.first
    within(".post[data-post-id='#{post.id}']") do
      click_link(post.title)
    end
    expect(current_path).to eq(post_path(post))

    # Click the 'View all posts' button and verify that it redirects to the user's posts index page
    click_link('See all posts')
    expect(current_path).to eq(user_posts_path(user))
  end
end
