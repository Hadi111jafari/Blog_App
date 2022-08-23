require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before do
      get users_path
      @user = User.create( name: 'Hadi',
                          photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          bio: 'Lorem ipsum dolor sit amet', posts_counter: 0)
    end

    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'renders a html containing a "Hadi" title' do
      expect(response.body).to include('Hadi')
    end
  end
  describe 'GET /users/:id' do
    before do
      get user_path(1)
    end
    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include 'Hadi'
    end
  end
end
