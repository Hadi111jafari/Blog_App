require 'rails_helper'

RSpec.describe 'User listig path', type: :system do
  before do
    @user = User.create(name: 'Hadi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'something.',
                        posts_counter: 0)
    @user2 = User.create(name: 'Jafari', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'something.',
                         posts_counter: 1)
  end

  it 'should show the username of all existing users' do
    visit users_path
    expect(page).to have_content('Hadi')
    expect(page).to have_content('Jafari')
  end

  it 'should show the number of posts each user has written' do
    visit users_path
    expect(page).to have_content('Number of Posts: 0')
    expect(page).to have_content('Number of Posts: 1')
  end
end
