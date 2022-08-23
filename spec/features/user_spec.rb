require 'rails_helper'

RSpec.describe 'User listig path', type: :feature do
  before do
    @user = User.create(name: 'Hadi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'This is my bio.',
                        posts_counter: 0)
    Post.create(author: @user, title: 'Post 1', text: 'Lorem ipsum dolor sit amet', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: @user, title: 'Post 2', text: 'Lorem ipsum dolor sit amet', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: @user, title: 'Post 3', text: 'Lorem ipsum dolor sit amet', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: @user, title: 'Post 4', text: 'Lorem ipsum dolor sit amet', comments_counter: 0,
                likes_counter: 0)
    @post5 = Post.create(author: @user, title: 'Post 5', text: 'Lorem ipsum dolor sit amet', comments_counter: 0,
                         likes_counter: 0)
  end

  it 'should show the user\'s profile picture.' do
    visit user_path(@user)
    expect(page.find('img')['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
  end

  it 'should show the user\'s username.' do
    visit user_path(@user)
    expect(page).to have_content('Hadi')
  end

  it 'should show the user\'s number of posts.' do
    visit user_path(@user)
    expect(page).to have_content('Number of posts: 5')
  end

  it 'should show the user\'s bio.' do
    visit user_path(@user)
    expect(page).to have_content('This is my bio.')
  end

  it 'should show the user\'s first 3 posts.' do
    visit user_path(@user)
    expect(page).to have_content('Post 5')
    expect(page).to have_content('Post 4')
    expect(page).to have_content('Post 3')
    expect(page).to_not have_content('Post 2')
  end

  it 'should show a button that lets me view all of a user\'s posts.' do
    visit user_path(@user)
    expect(page).to have_content('See all posts')
  end

  it 'should rediects to the user\'s posts show page after clicking a post title.' do
    visit user_path(@user)
    click_on 'Post 5'
    expect(page).to have_current_path(user_post_path(@user, @post5))
  end

  it 'should redirects the user to the user\'s post\'s index page when clicking to see all posts' do
    visit user_path(@user)
    click_on 'See all posts'
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
