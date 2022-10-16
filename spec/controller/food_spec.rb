require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Olawale', email: 'olapetanwale@yahoo.com', password: 'password', password_confirmation:'password', confirmed_at: Time.now)
    visit '/users/sign_in'
    fill_in 'Email', with: 'olapetanwale@yahoo.com'
    fill_in 'Password', with: 'password'   
  end

  describe 'GET /Index' do
    it 'navigates to the sign in page' do
      visit '/users/sign_in'
      expect(current_path).to eq(new_user_session_path)
    end

    it 'Signs in users ' do
      click_button 'Log in' 
      expect(current_path).to eq(root_path)
    end

    it 'users can sign in' do
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
  end
  after(:all) do
    User.destroy_all
  end
end
