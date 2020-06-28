require 'rails_helper'

RSpec.describe 'My Settings', type: :system do
  login_user

  it 'should be able to visit my_settings' do
    visit my_settings_path

    expect(page).to have_current_path(my_settings_path)
  end

  it 'should edit my settings successfully' do
    visit my_settings_path

    within '#edit_my_user' do
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_name', with: 'Test'
    end

    click_button('Update My Settings')
    expect(page).to have_current_path(my_settings_path)
  end

  it 'and fail to edit my settings successfully' do
    visit my_settings_path

    within '#edit_my_user' do
      fill_in 'user_email', with: ''
      fill_in 'user_name', with: 'Test'
    end

    click_button('Update My Settings')
      expect(page).to have_content('error')
      expect(page).to have_current_path(update_my_settings_path)
    end
end