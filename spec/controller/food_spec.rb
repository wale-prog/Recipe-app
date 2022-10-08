require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  before(:all) do
    Capybara.visit '/users/sign_up'
    Capybara.fill_in 'Name', with: 'Olawale'
    Capybara.fill_in 'Email', with: 'olapetanwale@yahoo.com'
    Capybara.fill_in 'Password', with: 'password'
    Capybara.fill_in 'Password confirmation', with: 'password'
  end

  describe 'GET /Index' do
    it 'navigates to the sign in page' do
      expect(Capybara.current_path).to eq(new_user_registration_path)
    end

    it 'Signs up users and send confirmation' do
      Capybara.click_button 'Sign up'
      expect(Capybara.current_path).to eq('/users')
    end

    it 'users can sign in' do
      Capybara.click_button 'Sign up'
      get '/users'
      expect(response).to have_http_status(:redirect)
    end
  end
end
