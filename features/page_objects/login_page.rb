module DPG
    class LoginPage < BasePage
        LOGIN_SELECTOR = '.account-login'
        PASSWORD_FIELD = '#password'
        SUBMIT_BUTTON  = '#loginSubmit'
        USERNAME_FIELD = '#username'

        def password_input
            page.find(PASSWORD_FIELD)
        end

        def username
            page.find(USERNAME_FIELD)
        end

        def submit_button_by_text(button_text)
            page.find(SUBMIT_BUTTON, text: button_text)
        end

  end
end

World(DPG)