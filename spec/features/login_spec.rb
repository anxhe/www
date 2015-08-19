require 'rails_helper'

feature 'Login page' do
  scenario 'when visiting /login' do
    skip
    visit admin_login_path

    expect(page).to  have_content('Iniciar sesión con GitHub')
  end
end

