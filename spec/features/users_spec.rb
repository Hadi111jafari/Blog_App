require 'rails_helper'

RSpec.describe 'User listig path', type: :feature do
  before do
    @user = User.create(id: 1, name: 'ali', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'something.',
                        posts_counter: 0)
    @user2 = User.create(id: 2, name: 'Jafari', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'something.',
                         posts_counter: 1)
  end

  it 'should show the username of all existing users' do
    visit users_path
    expect(page).to have_content('ali')
    expect(page).to have_content('Jafari')
  end

  it 'should show the profile picture for each user.' do
    visit users_path
    expect(page.find('#ali-img-1')['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
    expect(page.find('#Jafari-img-2')['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
  end

  it 'should show the number of posts each user has written' do
    visit users_path
    expect(page).to have_content('Number of Posts: 0')
    expect(page).to have_content('Number of Posts: 1')
  end

  it 'should redirected to that user\'s show page, when the username is clicked.' do
    visit users_path
    click_on 'ali'

    expect(page).to have_current_path(user_path(@user))
  end
end
