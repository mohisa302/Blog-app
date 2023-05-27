require 'rails_helper'

RSpec.describe 'Users', type: :system, js: true do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'Malik', photo: 'https://images.unsplash.com/photo-1510915228340-29c85a43dcfe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', bio: 'Web Developer',
                          posts_counter: 0)
      visit users_path
    end

    it 'renders the list of users' do
      expect(page).to have_content(@user.name)
    end

    it "renders user's profile picture" do
      find("img[src='#{@user.photo}']")
    end
    it 'renders number of posts for user' do
      expect(page).to have_content(@user.posts_counter)
    end

    it "When I click on a user, I am redirected to that user's show page" do
      visit(user_path(@user.id))
      expect(page).to have_content('Bio')
    end
  end

  describe 'show page' do
    before(:example) do
      @user = User.create(name: 'Malik', photo: 'https://images.unsplash.com/photo-1510915228340-29c85a43dcfe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', bio: 'Web Developer',
                          posts_counter: 0)
      @post1 = Post.create(author: @user, title: 'Hello One', text: 'This is my first post', likes_counter: 0,
                           comments_counter: 0)
      @post2 = Post.create(author: @user, title: 'Post two', text: 'This is my 2nd post', likes_counter: 0,
                           comments_counter: 0)
      @post3 = Post.create(author: @user, title: 'Post three', text: 'This is my 3rd post', likes_counter: 0,
                           comments_counter: 0)
      visit user_path(@user)
    end

    it "renders user's profile picture" do
      find("img[src='#{@user.photo}']")
    end

    it 'renders username' do
      expect(page).to have_content(@user.name)
    end

    it "recders user's post count" do
      expect(page).to have_content(@user.posts_counter)
    end

    it "recders user's bio" do
      expect(page).to have_content(@user.bio)
    end

    it "renders the user's last 3 posts" do
      expect(page).to have_content(@post1.title)
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post3.title)
    end

    it 'renders a button to redirect to posts page' do
      expect(page).to have_content('See all posts')
    end

    it "redirects to the user's post show page" do
      click_link @post1.title
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end

    it "redirects to the user's posts index page" do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
