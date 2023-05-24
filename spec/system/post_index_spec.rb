require 'rails_helper'

RSpec.describe Post, type: :model do
  author = User.create(name: 'Tom & Jerry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Best friends')
  subject do
    Post.new(title: 'Physics', text: 'This is not my first post', comments_counter: 10, likes_counter: 10,
             author_id: author)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be too short' do
    subject.title = 'a'
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'title should not be empty' do
    subject.title = ' '
    expect(subject).to_not be_valid
  end

  it 'title should have valid value' do
    expect(subject.title).to eql 'Physics'
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'text should have valid value' do
    expect(subject.text).to eql 'This is not my first post'
  end

  it 'comments_counter should have valid value' do
    subject.comments_counter = 12.2
    expect(subject).to_not be_valid
  end

  it 'comments_counter must not be less than 1' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should have valid value' do
    subject.likes_counter = 12.2
    expect(subject).to_not be_valid
  end

  it 'likes_counter must not be less than 1' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should return 5 recent comments' do
    expect(subject.recent_comments).to eq(subject.comments.order(created_at: :asc).limit(5))
  end
end
