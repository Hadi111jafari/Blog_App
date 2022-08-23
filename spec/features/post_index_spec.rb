require 'rails_helper'

RSpec.describe 'Post listig path', type: :feature do
  before do
    @user = User.create(id: 1, name: 'Hadi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'This is my bio.',
                        posts_counter: 0)
    @post = Post.create(author: @user, title: 'Post 1', text: 'Lorem ipsum dolor sit amet', comments_counter: 0,
                        likes_counter: 0)
    Comment.create(post: @post, author: @user,
                   text: 'Comment 1 for Post 1')
    Comment.create(post: @post, author: @user,
                   text: 'Comment 2 for Post 1')
  end

  it 'should show the user\'s profile picture.' do
    visit user_posts_path(@user)
    expect(page.find('img')['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
  end

  it 'should show the user\'s username.' do
    visit user_posts_path(@user)
    expect(page).to have_content('Hadi')
  end

  it 'should show the number of posts the user has written.' do
    visit user_posts_path(@user)
    expect(page).to have_content('Number of posts: 1')
  end

  it 'should show the a post\'s title' do
    visit user_posts_path(@user)
    expect(page).to have_content('Post 1')
  end

  it 'should show some of the post\'s body' do
    visit user_posts_path(@user)
    expect(page).to have_content('Lorem ipsum dolor sit amet')
  end

  it 'should show some of the post\'s body' do
    visit user_posts_path(@user)
    expect(page).to have_content('Lorem ipsum dolor sit amet')
  end

  it 'checks that I can see the first comments on a post.' do
    visit user_posts_path(@user)
    expect(page).to have_content('Comment 1 for Post 1')
    expect(page).to have_content('Comment 2 for Post 1')
  end

  it 'checks that I can see how many comments a post has.' do
    visit user_posts_path(@user)
    expect(page).to have_content('Comments: 2')
  end

  it 'checks that I can see how many likes a post has.' do
    visit user_posts_path(@user)
    expect(page).to have_content('Likes: 0')
  end

  it 'checks that I can see a section for pagination if there are more posts than fit on the view.' do
    visit user_posts_path(@user)
    expect(page).to have_content('Pagination')
  end

  it 'checks that When I click on a post, it redirects me to that post\'s show page.' do
    visit user_posts_path(@user)
    click_on 'Post 1'
    expect(page).to have_current_path(user_post_path(@user, @post))
  end
end
