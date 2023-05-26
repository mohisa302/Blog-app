require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Mohi',
      bio: 'Aspiring FullStack Dev',
      photo: 'https://via.placeholder.com/150',
      posts_counter: 2
    )

    @user2 = User.create(
      name: 'Mohi2',
      bio: 'FullStack Dev',
      photo: 'https://via.placeholder.com/150',
      posts_counter: 3
    )
  end

  describe 'user index paged' do
    it 'displays correct username' do
      visit users_path
      expect(page).to have_content('Mohi')
      expect(page).to have_content('Mohi2')
      expect(page).to_not have_content('Caicedo')
    end

    it 'shows user profile photo' do
      visit users_path
      expect(page).to have_css("img[src*='https://via.placeholder.com/150']")
      expect(page).to have_css("img[src*='https://via.placeholder.com/150']")
    end

    it 'shows the correct number of posts' do
      visit users_path

      expect(page).to have_content('Number of posts: 2')
      expect(page).to have_content('Number of posts: 3')
    end

    it 'shows the user_path when clicked' do
      visit users_path
      find('a', text: 'Mohi2').click
      expect(page).to have_current_path(user_path(@user2))
    end

    it 'it shows the bio in show path' do
      visit users_path
      click_link 'Mohi2'
      expect(page).to have_content('FullStack Dev')
    end
  end
end
