module Features
  module SessionHelpers
    def signin(scope, email, password)
      visit send("new_#{scope.to_s}_session_path")

      fill_in I18n.t('.email', default: 'Email'), with: email
      fill_in I18n.t('.password', default: 'Password'), with: password

      click_button I18n.t('.sign_in', default: 'Sign in')
    end
  end
end
