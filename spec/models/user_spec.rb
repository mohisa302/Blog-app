require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'John', posts_counter: 5) }

  describe 'validations' do
    it 'validates presence of name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'validates numericality of posts_counter' do
      subject.posts_counter = 'invalid'
      expect(subject).to_not be_valid

      subject.posts_counter = -1
      expect(subject).to_not be_valid

      subject.posts_counter = 0
      expect(subject).to be_valid
    end
  end
end
