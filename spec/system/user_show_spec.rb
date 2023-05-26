require 'spec_helper'

RSpec.describe 'User profile page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'John Doe',
      bio: 'Web Developer',
      photo: 'https://via.placeholder.com/150',
      posts_counter: 0
    )

    # Create first 3 posts for this user
    3.times do |n|
      @post = @user.posts.create(title: "Title #{n + 1}", text: 'Lorem ipsum dolor sit amet.', comments_counter: 0, author_id: 1, likes_counter: 0)
    end
  end

  it 'shows user profile picture' do
    visit user_path(@user)
    expect(page).to have_css("img[src*='https://via.placeholder.com/150']")
  end

  it "shows user's username" do
    visit user_path(@user)
    expect(page).to have_content('John Doe')
  end

  it 'shows the number of posts the user has written' do
    visit user_path(@user)
    expect(page).to have_content('Number of posts: 3')
  end

  it "shows the user's bio" do
    visit user_path(@user)
    expect(page).to have_content('Web Developer')
  end

  it "shows the user's first 3 posts" do
    visit user_path(@user)

    # Check that the titles of the first 3 posts are present on the page
    expect(page).to have_content('Title 1')
    expect(page).to have_content('Title 2')
    expect(page).to have_content('Title 3')
  end

  it 'displays a button for all user posts' do
    visit user_path(@user)
    expect(page).to have_content('See all posts')
  end

  it 'click a user post, it redirects to that specific post show page' do
    # navigate to the user profile page
    visit user_path(@user)
    # click the "See all posts" button
    click_link 'See all posts'
    # assert that the current URL is the expected one
    expect(page).to have_current_path(user_posts_path(@user))
    expect(page).to have_content('Lorem ipsum dolor sit amet.')
  end

  it 'click to see all posts, it redirects to the user post index page' do
    visit user_path(@user)
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
