require 'spec_helper'

RSpec.describe 'Post index page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Mohi',
      bio: 'Aspiring FullStack Dev',
      photo: 'https://via.placeholder.com/150',
      posts_counter: 2
    )

    @user2 = User.create(
      name: 'nati',
      bio: 'FullStack Dev',
      photo: 'https://via.placeholder.com/150',
      posts_counter: 2
    )

    @post1 = Post.create(
      title: 'Test',
      text: 'First Post',
      comments_counter: 0,
      likes_counter: 0,
      author: @user
    )

    @post2 = Post.create(
      title: 'Test 2',
      text: 'Second Post',
      comments_counter: 0,
      likes_counter: 0,
      author: @user2
    )

    @comment1 = Comment.create(
      text: 'First Comment',
      post: @post1,
      author: @user2
    )

    @comment2 = Comment.create(
      text: 'Second Comment',
      post: @post1,
      author: @user2
    )

    @like1 = Like.create(
      post: @post1,
      author: @user2
    )
  end

  describe 'the post index page' do
    it 'displays user profile picture' do
      visit user_posts_path(@user)
      expect(page).to have_css("img[src*='https://via.placeholder.com/150']")
    end

    it 'displays the user username' do
      visit user_posts_path(@user)
      expect(page).to have_content('Mohi')
    end

    it 'displays number of posts the user has written' do
      visit user_posts_path(@user)
      expect(page).to have_content('Number of posts: 3')
    end

    it 'displays how many likes a post has' do
      visit user_posts_path(@user)
      expect(page).to have_content('likes: 1')
    end

    it 'displays some of the posts body' do
      visit user_posts_path(@user)
      expect(page).to have_content('First Post')
    end

    it 'displays posts title.' do
      visit user_posts_path(@user)
      expect(page).to have_content('Test')
    end

    it 'displays the first comments on a post.' do
      visit user_posts_path(@user)
      expect(page).to have_content('First Comment')
    end

    it 'section for pagination if there are more posts than fit on the view' do
      visit user_posts_path(@user)
      expect(page).to have_content('pagination')
    end

    it 'displays how many comments a post has' do
      visit user_posts_path(@user)
      expect(page).to have_content('comments: 2')
    end

    it 'click on a post, it redirects to that post show page.' do
      visit user_posts_path(@user)
      click_link 'Test'
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end
  end
end
