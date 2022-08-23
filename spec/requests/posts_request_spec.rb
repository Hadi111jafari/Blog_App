require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  # before do
  #   @user = User.create( name: 'Hadid',
  #                       photo: 'https://images.pexels.com',
  #                       bio: 'Lorem ipsum ', posts_counter: 0)
  #   @post = Post.create( author: @user, title: 'Post 1', text: 'Lorem ipsum dolor sit amet', comments_counter: 0,
  #                       likes_counter: 0)
  # end
  describe 'GET /index' do
    before do
      get user_posts_path(1)

      @user = User.create( name: 'Hadid',
        photo: 'https://images.pexels.com',
        bio: 'Lorem ipsum ', posts_counter: 0)
        
       @post = Post.create( author: @user, title: 'Post 1', text: 'Lorem ipsum dolor sit amet', comments_counter: 0,
        likes_counter: 0)
    end
    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'renders a html containing "Number of posts" text' do
      expect(response.body).to include 'Number of posts'
    end
  end

  describe 'GET /show' do
    before do
      get '/users/1/posts/1'
    end

    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it 'renders a html containing a "Post 1" text as title' do
      expect(response.body).to include 'Post 1'
    end
  end
end
