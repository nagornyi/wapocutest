class UserPage < PhpLoginSite
  @title = "User Page"

  # Here you place all page-related methods
  def logged_in?
    Watir::Wait.until { logged_in_element.exists? }
  end

  def signout
    signout_link.click
    LoginPage.new(@browser)
    next_page = LoginPage.new(@browser)
    Watir::Wait.until { next_page.loaded? LoginPage.title }

    next_page
  end

  private

  def logged_in_element
    @browser.div(:id => "logged-in")
  end

  def signout_link
    @browser.link(:text => "Sign Out")
  end
end

