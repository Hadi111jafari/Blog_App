require 'rails_helper'

RSpec.describe 'Post listig path', type: :feature do
  before do
    @user = User.create( name: 'Mahdi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'This is my bio.', posts_counter: 0)
    @user1 = User.create( name: 'Jafari', photo: 'https://unsplash.com/photos/F_-0BxGuV32',
                         bio: 'This is my bio.', posts_counter: 0)
    @post = Post.create(author: @user, title: 'Post 1', text: 'Lorem ipsum dolor sit amet', comments_counter: 0,
                        likes_counter: 0)
    Comment.create(post: @post, author: @user,
                   text: 'Comment 1 for Post 1')
    Comment.create(post: @post, author: @user1,
                   text: 'Comment 2 for Post 1')
  end

  it 'should show the a post\'s title' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Post 1')
  end

  it 'shows who wrote the post' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Post by: Mahdi')
  end

  it 'check that I can see how many comments it has.' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Comments: 2')
  end

  it 'check that I can see how many likes it has.' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Likes: 0')
  end

  it 'should show some the post\'s body' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Lorem ipsum dolor sit amet')
  end

  it 'checks that I can see the username of each commentor.' do
    visit user_post_path(@user, @post)
    expect(page).to have_content('Mahdi:')
    expect(page).to have_content('Jafari:')
  end

  it 'checks that I can see the username of each commentor.' do
    visit user_post_path(@user, @post)
    expect(page).to have_content("Mahdi:\nComment 1 for Post 1")
    expect(page).to have_content("Jafari:\nComment 2 for Post 1")
  end
end
