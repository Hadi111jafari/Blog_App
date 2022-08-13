require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.new(name: 'Hadi', photo: 'photo_url', bio: 'Software Engineer', posts_counter: 1)
  end

  subject do
    Post.new(author: @user, title: 'Quantum Tunnelling', text: 'it is possible to ...', comments_counter: 1,
             likes_counter: 1)
  end

  before { subject.save }

  describe 'Inputs fields' do
    it 'Author should be present' do
      subject.author = nil
      expect(subject).to_not be_valid
    end

    it 'Title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Text is not require' do
      subject.text = nil
      expect(subject).to be_valid
    end
  end

  describe 'Comments Counter test' do
    it 'Comments Counter is not negative' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Comments Counter is only integer' do
      subject.comments_counter = 1.5
      expect(subject).to_not be_valid
    end

    it 'Comments Counter greater than zero' do
      subject.comments_counter = 1
      expect(subject).to be_valid
    end
  end

  describe 'Likes Counter test' do
    it 'Likes Counter is not negative' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Likes Counter is only integer' do
      subject.likes_counter = 1.5
      expect(subject).to_not be_valid
    end

    it 'Likes Counter greater than zero' do
      subject.likes_counter = 2
      expect(subject).to be_valid
    end
  end

  it 'Last 5 comments method' do
    comment1 = Comment.new(author: @user, text: 'text1', post: subject)
    comment1.save
    comment2 = Comment.new(author: @user, text: 'text2', post: subject)
    comment2.save
    comment3 = Comment.new(author: @user, text: 'text3', post: subject)
    comment3.save
    comment4 = Comment.new(author: @user, text: 'text4', post: subject)
    comment4.save
    comment5 = Comment.new(author: @user, text: 'text5', post: subject)
    comment5.save
    comment6 = Comment.new(author: @user, text: 'text6', post: subject)
    comment6.save
    expect(subject.last_5_comments).to eq([comment6, comment5, comment4, comment3, comment2])
  end
end
