require 'rails_helper'

RSpec.describe 'User listig path', type: :feature do
  before do
    @user = User.create(name: 'Hadi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'something.', posts_counter: 1)
    @user2 = User.create(name: 'Jafari', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'something.', posts_counter: 1)
  end
  it 'should show the username of all existing users' do 
    visit users_path
    expect(page).to have_content('Hadi')
    expect(page).to have_content('Jafari')
  end
end