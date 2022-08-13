require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.new(name: 'Hadi Jafari', photo: 'photo_url', bio: 'Software Engineer', posts_counter: 1)
    @user.save
    @post = Post.new(author: @user, title: 'Quantum Tunnelling', text: 'it is possible to ...', comments_counter: 1,
                     likes_counter: 1)
    @post.save
    @comment = Comment.new(post: @post, author: @user, text: 'interesting topic')
    @comment.save
  end

  subject { Like.new(author: @user, post: @post) }

  before { subject.save }

  describe 'Like Model Properties' do
    it 'author_id should be present' do
      @like = Like.new(author: @user, post: @post)
      expect(@like).to be_valid
    end

    it 'post_id should be present' do
      @like = Like.new(author: @user, post: @post)
      expect(@like).to be_valid
    end

    it 'should have author' do
      expect(@post.author).to eq(@user)
    end

    it 'should have post' do
      expect(subject.post).to eq(@post)
    end
  end
end
