require 'rails_helper'

RSpec.describe 'Users controller', type: :request do
  it 'renders users page' do
    get '/users'

    expect(response).to have_http_status(:ok)

    expect(response).to render_template(:index)

    expect(response.body).to include('All users')
  end

  it 'renders a page for specific user' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    get "/users/#{user.id}"

    expect(response).to have_http_status(:ok)

    expect(response).to render_template(:show)

    expect(response.body).to include('Single user')
  end
end
