require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Hadi', photo: 'photo_url', bio: 'Software Engineer', posts_counter: 1) }

  before { subject.save }

  describe 'Inputs fields' do
    it 'Name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Photo is not require' do
      subject.photo = nil
      expect(subject).to be_valid
    end

    it 'Bio is not require' do
      subject.bio = nil
      expect(subject).to be_valid
    end
  end

  describe 'Posts Counter test' do
    it 'Posts Counter is not negative' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Posts Counter is only integer' do
      subject.posts_counter = 1.5
      expect(subject).to_not be_valid
    end

    it 'Posts Counter greater than zero' do
      subject.posts_counter = 1
      expect(subject).to be_valid
    end
  end

  it 'Last 3 posts method' do
    post1 = Post.new(author: subject, title: 'Post title1', text: 'text1', comments_counter: 1, likes_counter: 1)
    post1.save
    post2 = Post.new(author: subject, title: 'Post title2', text: 'text2', comments_counter: 2, likes_counter: 2)
    post2.save
    post3 = Post.new(author: subject, title: 'Post title3', text: 'text3', comments_counter: 3, likes_counter: 3)
    post3.save
    post4 = Post.new(author: subject, title: 'Post title4', text: 'text4', comments_counter: 4, likes_counter: 4)
    post4.save
    expect(subject.last_3_posts).to eq([post4, post3, post2])
  end
end
