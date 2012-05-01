class LoginPage < PhpLoginSite
  @title = "Login Page"

  # Here you place all page-specific methods
  def open
    @browser.goto @@site_url + "/login.php"
	Watir::Wait.until { self.loaded? LoginPage.title}
    self
  end

  def login_as(user, pass)
    user_field.set user
    password_field.set pass
    login_button.click

    next_page = UserPage.new(@browser)
    Watir::Wait.until { next_page.loaded? UserPage.title}

    next_page
  end

  # Alternative implementation: LoginForm class encapsulates whole Login Box behavior
  def login_as_alternative(user, pass)
	login_box = LoginForm.new(@browser)
    login_box.login_as user, pass
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

