require "rails_helper"

RSpec.feature 'Sign in', :devise do

  let(:user) { create(:student) }

  scenario 'user cannot sign in if not registered' do
    signin(:student, "no@home.com", "any!password1")
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'Email'
  end

  scenario 'user can sign in with valid credentials' do
    signin(:student, user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  scenario 'user cannot sign in with wrong email' do
    signin(:student, "someoneelse@example.com", user.password)
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'Email'
  end

  scenario 'user cannot sign in with wrong password' do
    signin(:student, user.email, 'invalidpass')
    expect(page).to have_content I18n.t 'devise.failure.invalid', authentication_keys: 'Email'
  end

end
