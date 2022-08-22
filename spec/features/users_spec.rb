require 'rails_helper'

RSpec.describe 'User listig path', type: :feature do
  it 'it should render the users index page' do 
    visit users_path
    expect(page).to have_content('Users')
  end
end