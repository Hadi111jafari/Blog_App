require 'rails_helper'

RSpec.describe 'User listig path', type: :feature do
  before do
    @user = User.create(id: 1, name: 'Hadi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'something.',
                        posts_counter: 0)
  end

  it 'shoult show the user\'s profile picture.' do
    visit user_path(@user)
    expect(page.find('img')['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
  end
end