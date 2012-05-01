class LoginForm < BrowserContainer

  # Here you place all element-specific methods
  def login_as(user, pass)
    user_field.set user
    password_field.set pass

    login_button.click

    next_page = UserPage.new(@browser)
    Watir::Wait.until { next_page.loaded? UserPage.title}

    next_page
  end

  private

  def user_field
    @browser.text_field(:name => "username")
  end

  def password_field
    @browser.text_field(:name => "password")
  end

  def login_button
    @browser.button(:value => " Submit ")
  end

end

