require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.new(name: 'Hadi', photo: 'photo_url', bio: 'Software Engineer', posts_counter: 0)
    @user.save
    @post = Post.new(author: @user, title: 'Quantum Tunnelling', text: 'it is possible to ...', comments_counter: 0,
                     likes_counter: 0)
    @post.save
    @comment = Comment.new(post: @post, author: @user, text: 'interesting topic')
    @comment.save
  end

  subject { Comment.new(author: @user, text: 'comment', post: @post) }

  before { subject.save }

  describe 'Comment Model Properties' do
    it 'text should be present' do
      @comment.text = 'cool'
      expect(@comment).to be_valid
    end

    it 'author_id should be present' do
      @comment.author = nil
      expect(@comment).to_not be_valid
    end

    it 'post_id should be present' do
      @comment.post = nil
      expect(@comment).to_not be_valid
    end

    it 'should have author' do
      expect(subject.author).to eq(@user)
    end

    it 'should have post' do
      expect(subject.post).to eq(@post)
    end
  end
end
