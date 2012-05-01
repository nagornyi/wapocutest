class SearchPage < GoogleSite

  # Here you place all page-specific methods
  def open
    @browser.goto @@site_url + "/"
    self
  end

  def search text
    search_field.set text
	sleep 5
    search_button.click
    ResultsPage.new(@browser)
  end

  private

  def search_field
    @browser.text_field(:xpath => "//*[@id='lst-ib']")
  end

  def search_button
    @browser.button(:name => "btnG")
  end
end

